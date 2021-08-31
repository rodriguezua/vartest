# ENV var test

Image includes SSH configuration to run on the AppService Linux.

**To test locally:**

*docker build -t _img_name .*

*docker run -d -p 3000:3000 _img_name*


**On the AppService:**

*New AppSetting **PORT 3000** is required*
