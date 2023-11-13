CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

set -e
if [[ -f student-submission/ListExamples.java ]]
then 
    echo 'file found'
else 
    echo 'File not found'
    exit 1
fi

cp -R student-submission/. grading-area
cp TestListExamples.java grading-area


javac grading-area/ListExamples.java

cp -R lib grading-area
cd grading-area
javac -cp '.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar' TestListExamples.java
java -cp '.;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar' org.junit.runner.JUnitCore TestListExamples
cd ..


# Then, add here code to compile and run, and do any post-processing of the
# tests
