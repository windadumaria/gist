To make the automation test I used Robot Framework. It is a Python-based, extensible keyword-driven test automation framework for end-to-end acceptance testing and acceptance-test-driven development (ATDD). 

Before run the automation test, please follow these instructions.

1. Robot Framework is supported on Python (both Python 2 and Python 3), Jython (JVM) and IronPython(.NET) and PyPy. The interpreter you want to use should be installed before installing the framework itself.

2. Use pip to install Robot Framework
—————————————————————————————————————————————————
pip install robotframework
—————————————————————————————————————————————————
For further information please check this link https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#installation-instructions

3. After a successful installation, you should be able to execute this command 
—————————————————————————————————————————————————
robot --version
—————————————————————————————————————————————————

4. Install library for the automation test using command 
—————————————————————————————————————————————————
pip install robotframework-selenium2library
—————————————————————————————————————————————————

5. Copy the automated-tests folder into your local

5. Chrome driver in this folder for Chrome version 74. If it's different from your Chrome version download from here https://sites.google.com/a/chromium.org/chromedriver/downloads based on your Chrome version.
Replace the existing chrome driver.

6. Execute ‘main.robot’ using command
—————————————————————————————————————————————————
robot --variable USERNAME:<username> --variable PASSWORD:<password> main.robot 
—————————————————————————————————————————————————