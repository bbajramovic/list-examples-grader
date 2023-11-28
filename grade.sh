CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
then 
    echo 'file found'
else 
    echo 'File not found'
    exit 1
fi

cp -R student-submission/. grading-area
cp TestListExamples.java grading-area
cp -R lib grading-area

cd grading-area
javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > results.txt

javac ListExamples.java

if [[ `grep "There was 1 failure:" results.txt` ]]
then
    echo "0/1"
else
    echo "1/1"
fi
cd ..