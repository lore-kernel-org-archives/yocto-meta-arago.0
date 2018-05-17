Return-Path: <timothy.godfrey@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by arago-project.org (Postfix) with ESMTPS id 4EB59529B3
	for <meta-arago@arago-project.org>;
	Thu, 17 May 2018 06:11:14 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id a8-v6so6231555wmg.5
	for <meta-arago@arago-project.org>;
	Wed, 16 May 2018 23:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=rIXm8NGdMBSBASrO6DppGD/w7cxuDVfPogcI/fExe7E=;
	b=efSJog8Kc0OnvtVfp+693slzpjtmaauHZfRZIB0NehY9P3wdJKSuHsIvjIS3G2oHAn
	Rm5cjhm3O7IQrmEuwIPWH0Xi66WPSdrlx7+0zS7LdY8pP4bfhH99WrwlEu/lx+axNH32
	aRCLp0mcbkx1i7ikepWIG5wSTjrlKIHb3xwB1vrrLLDRAaI8c4m2b2a8JRCaWO2oTJtU
	6fYB8UchLXX4vOOJMxHX2ngz0NPzSWzc2Lb9uaLtrR8vDYFAbJ67Py8w1NfE/J3n9saB
	ORPHrdGseoTyBqd6bvANVGNh2cnUw5b+5WUYRY75NfZ/EzGrPm+i/1lfnafZ60uiOgGu
	q2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=rIXm8NGdMBSBASrO6DppGD/w7cxuDVfPogcI/fExe7E=;
	b=RWlui2c8dfalOcu+gD1FxDw+L2VP/8LmzWrL1rsB6+IsIHx2tYTQu1PF1vDLWO1WKA
	Oruvf9OK7UvYw8OIPCPhqez67tudnHjuCJTUc0A+clAGUjKxtUJmBbYbTA8tx3dSHR5Z
	T9xG7Wut6c5sG7fHJYKBncTRGslaf+Wy9hySFgmS2MvtXotrv3jMLong4CTYbV7DsiI3
	6fGGtA3sfesEM7NS+cJKTU8UVNaflGQN3Rviw8+vxULGnexe2OGH8+FeCVvLA65RTK6S
	4poEF7Pzga9oz3fEGRg0+nQSqNmTKOjzFa7Uscz5m4rJ9HcgQuT8sn9pLtYOou7ydAKy
	ahaQ==
X-Gm-Message-State: ALKqPwcmPLdXsFvSkwVdkysnKbimXTWEggDL322XHck9gc97rOHNX+OD
	fgjbA7kolFS/dmHm+qJq/yON7KafJ+HI9dMOryf4
X-Google-Smtp-Source: AB8JxZpE0dZVpjCFPhQu2HUGvKfcHRWlaH04j/pUMvfULTviDcsU08J+hv6SmB1CZ5byrttR7gTS1CB2AW5qmxWPfDs=
X-Received: by 2002:a1c:d1c2:: with SMTP id
	i185-v6mr747621wmg.10.1526537468257; 
	Wed, 16 May 2018 23:11:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.65.6 with HTTP; Wed, 16 May 2018 23:11:07 -0700 (PDT)
From: Tim Godfrey <timothy.godfrey@gmail.com>
Date: Thu, 17 May 2018 16:11:07 +1000
Message-ID: <CAHb6uwfOE-EHqsxARvXCETWRwfyVg-2o1qWV0K15AGW8MWZo6A@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: TI unpack task not returning/exiting
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 17 May 2018 06:11:15 -0000
Content-Type: multipart/alternative; boundary="000000000000883049056c60b33e"

--000000000000883049056c60b33e
Content-Type: text/plain; charset="UTF-8"

Hello!

I raised this question on the bitbake-devel mailing list, because I thought
it might have been a problem with bitbake or the underlying Python task.
Somebody helpfully replied and suggested that it might be because of the
called setup wizard waiting for input. I have run the installer myself
directly and it exits without waiting for a keypress or the like, so I'm a
bit stuck. Considering that it is a TI binary installer I wondered whether
the arago list is a better place to ask the question. Apologies for the
cross/re posting.

A recipe I am working with hangs on the do_unpack task. Looking at the
logs, the sub-task appears to complete successfully, but the calling task
doesn't complete, and the overall bitbake build process doesn't either.

This is the complete log for the do_unpack task:

DEBUG: Executing python function do_unpack
DEBUG: Executing python function base_do_unpack
NOTE: Unpacking
/home/tim/tisdk/downloads/ti_cgt_c6000_8.2.2_linux_installer_x86.bin
to /home/tim/tisdk/build/arago-tmp-external-linaro-toolchain/
work/x86_64-nativesdk-arago-linux/nativesdk-ti-cgt6x/1_8.2.2-r0/
DEBUG: Python function base_do_unpack finished
DEBUG: Executing python function ti_bin_do_unpack
----------------------------------------------------------------------------
Welcome to the C6000 Code Generation Tools Setup Wizard.

----------------------------------------------------------------------------
Select Installation Directory

Please specify the directory where C6000 Code Generation Tools will be
installed. The installation requires 264592 KB.

Destination Directory [/home/tim/tisdk/build/arago-
tmp-external-linaro-toolchain/work/x86_64-nativesdk-arago-
linux/nativesdk-ti-cgt6x/1_8.2.2-r0/ti-cgt6x-8.2.2/ti-cgt-c6000_8.2.2]:
----------------------------------------------------------------------------
Setup is now ready to begin installing C6000 Code Generation Tools on your
computer.

Do you want to continue? [Y/n]:
----------------------------------------------------------------------------
Please wait while Setup installs C6000 Code Generation Tools on your
computer.

 Installing
 0% ______________ 50% ______________ 100%
 #########################################

----------------------------------------------------------------------------
Setup has finished installing C6000 Code Generation Tools on your computer.

The cooker log includes this line:

NOTE: recipe nativesdk-ti-cgt6x-1_8.2.2-r0: task do_unpack: Started

but there is no corresponding 'Succeeded' line in the log. I'm guessing it
has something to do with the ti_bin_do_unpack task not returning to the
calling do_unpack task.

Is this a known problem? Is there a known solution to it? On a related
point, if I would like to call the python tasks directly in order to
troubleshoot the problem, is there a standard/easy way to do that?

All input warmly received, thanks!
Tim

--000000000000883049056c60b33e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div>Hello!<br><br></div>I raised=
 this question on the bitbake-devel mailing list, because I thought it migh=
t have been a problem with bitbake or the underlying Python task. Somebody =
helpfully replied and suggested that it might be because of the called setu=
p wizard waiting for input. I have run the installer myself directly and it=
 exits without waiting for a keypress or the like, so I&#39;m a bit stuck. =
Considering that it is a TI binary installer I wondered whether the arago l=
ist is a better place to ask the question. Apologies for the cross/re posti=
ng.<br></div><div><br></div><div>A recipe I am working=20
with hangs on the do_unpack task. Looking at the logs, the sub-task=20
appears to complete successfully, but the calling task doesn&#39;t complete=
, and the=20
overall bitbake build process  doesn&#39;t either. <br><br></div>This is th=
e complete log for the do_unpack task:<br><br>DEBUG: Executing python funct=
ion do_unpack<br>DEBUG: Executing python function base_do_unpack<br>NOTE: U=
npacking /home/tim/tisdk/downloads/ti_<wbr>cgt_c6000_8.2.2_linux_<wbr>insta=
ller_x86.bin to /home/tim/tisdk/build/arago-<wbr>tmp-external-linaro-toolch=
ain/<wbr>work/x86_64-nativesdk-arago-<wbr>linux/nativesdk-ti-cgt6x/1_8.<wbr=
>2.2-r0/<br>DEBUG: Python function base_do_unpack finished<br>DEBUG: Execut=
ing python function ti_bin_do_unpack<br>------------------------------<wbr>=
------------------------------<wbr>----------------<br>Welcome to the C6000=
 Code Generation Tools Setup Wizard.<br><br>------------------------------<=
wbr>------------------------------<wbr>----------------<br>Select Installat=
ion Directory<br><br>Please specify the directory where C6000 Code Generati=
on Tools will be <br>installed. The installation requires 264592 KB.<br><br=
>Destination Directory [/home/tim/tisdk/build/arago-<wbr>tmp-external-linar=
o-toolchain/<wbr>work/x86_64-nativesdk-arago-<wbr>linux/nativesdk-ti-cgt6x/=
1_8.<wbr>2.2-r0/ti-cgt6x-8.2.2/ti-cgt-<wbr>c6000_8.2.2]: <br>--------------=
----------------<wbr>------------------------------<wbr>----------------<br=
>Setup is now ready to begin installing C6000 Code Generation Tools on your=
 <br>computer.<br><br>Do you want to continue? [Y/n]: <br>-----------------=
-------------<wbr>------------------------------<wbr>----------------<br>Pl=
ease wait while Setup installs C6000 Code Generation Tools on your computer=
.<br><br>=C2=A0Installing<br>=C2=A00% ______________ 50% ______________ 100=
%<br>=C2=A0#############################<wbr>############<br><br>----------=
--------------------<wbr>------------------------------<wbr>---------------=
-<br>Setup has finished installing C6000 Code Generation Tools on your comp=
uter.<br><br></div>The cooker log includes this line:<br><br>NOTE: recipe n=
ativesdk-ti-cgt6x-1_8.2.2-r0: task do_unpack: Started<br><br></div>but
 there is no corresponding &#39;Succeeded&#39; line in the log. I&#39;m gue=
ssing it=20
has something to do with the ti_bin_do_unpack task not returning to the=20
calling do_unpack task. <br><br></div>Is this a known problem? Is there a
 known solution to it? On a related point, if I would like to call the=20
python tasks directly in order to troubleshoot the problem, is there a=20
standard/easy way to do that?<br><br></div><div>All input warmly received, =
thanks!</div><div>Tim<br></div></div>

--000000000000883049056c60b33e--
