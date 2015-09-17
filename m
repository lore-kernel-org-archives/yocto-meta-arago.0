Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by arago-project.org (Postfix) with ESMTPS id BF5AF529FB
	for <meta-arago@arago-project.org>;
	Thu, 17 Sep 2015 03:24:48 +0000 (UTC)
Received: by vkhf67 with SMTP id f67so3456819vkh.1
	for <meta-arago@arago-project.org>;
	Wed, 16 Sep 2015 20:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=OWU8/JZxUy1gJ5ZUpMgHEflixlfWkbIhqc7iGDbNShc=;
	b=h99sPB1yxZryiA+r7bBi3ekFlKkn3rCIhc0f7wIEMz/viFgLCeI4B25z2a+n0XCfpR
	TqgXxAZBtnFX0eLlqzRjJpKe72yLzRGWKevZR7Q4E4lR8OZyuoAiyGfBXUoiL+sA5Uux
	UG1dW2+hM/62G8tUXDv3TPt/yrWBmqGlB1XNLURZqr1+MHdVOS1VhFSWZMfTJUQ51UaY
	yLf775rIBedt+dz/czj6coTcBjB3NPom1RTpsHBa5nUe4MJRUuZQ6cZIkcQVijwzctLN
	LzcnnkmXtvVhz4Uqm8KCRfts/2rUDXHafdX0SfzJ5ermRJCJJ+5jeL69qn2v9aVrJz2i
	VQxQ==
X-Received: by 10.31.107.213 with SMTP id k82mr33334692vki.5.1442460285018;
	Wed, 16 Sep 2015 20:24:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.201.130 with HTTP; Wed, 16 Sep 2015 20:24:25 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 17 Sep 2015 15:24:25 +1200
Message-ID: <CADySD0EXH6VNtEonLMfmDtqhygOLrdkOgp-WrR=xjxXxYzzdaw@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Mounting /var/log in NAND parition
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
X-List-Received-Date: Thu, 17 Sep 2015 03:24:55 -0000
Content-Type: multipart/alternative; boundary=001a114786f0e42d45051fe8f4e9

--001a114786f0e42d45051fe8f4e9
Content-Type: text/plain; charset=UTF-8

Hi,

In order to preserve log files in NAND partition, I mounted my NAND
patition /dev/mtdX in /var/log.

Disabled volatile file system from creating  any object or link to
/var/volatile/log by commenting out following in
/etc/default/volatiles/00_core

#d root root 0755 /var/volatile/log none
#l root root 0755 /var/log /var/volatile/log
#f root root 0664 /var/log/wtmp none

But when system boots, I still see /var/volatile/log and a symlink to it
inside /var/log

root@am335x-evm:~# ls -al /var/log/
drwxr-xr-x    3 root     root             0 Sep 17 00:05 .
drwxr-xr-x    8 root     root           808 Sep 16 23:36 ..
-rw-r--r--    1 root     root         23600 Sep 17 00:04 dmesg
-rw-r--r--    1 root     root           292 Sep 17 00:05 lastlog
lrwxrwxrwx    1 root     root            17 Sep 17 00:04 log ->
/var/volatile/log
-rw-r--r--    1 root     root         53389 Sep 17 00:05 messages
-rw-rw-r--    1 root     root          3456 Sep 17 00:05 wtmp


How to fix it ?

thanks
Ankur

--001a114786f0e42d45051fe8f4e9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:rgb(51,51,153)">Hi,</div><div class=3D"gmail_de=
fault" style=3D"font-family:georgia,serif;font-size:small;color:rgb(51,51,1=
53)"><br></div><div class=3D"gmail_default" style=3D"font-family:georgia,se=
rif;font-size:small;color:rgb(51,51,153)">In order to preserve log files in=
 NAND partition, I mounted my NAND patition /dev/mtdX in /var/log.</div><di=
v class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:smal=
l;color:rgb(51,51,153)"><br></div><div class=3D"gmail_default" style=3D"fon=
t-family:georgia,serif;font-size:small;color:rgb(51,51,153)">Disabled volat=
ile file system from creating =C2=A0any object or link to /var/volatile/log=
 by commenting out following in /etc/default/volatiles/00_core=C2=A0</div><=
div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:sm=
all;color:rgb(51,51,153)"><br></div><div class=3D"gmail_default" style=3D"f=
ont-family:georgia,serif;font-size:small;color:rgb(51,51,153)"><div class=
=3D"gmail_default">#d root root 0755 /var/volatile/log none</div><div class=
=3D"gmail_default">#l root root 0755 /var/log /var/volatile/log</div><div c=
lass=3D"gmail_default">#f root root 0664 /var/log/wtmp none</div><div class=
=3D"gmail_default"><br></div><div class=3D"gmail_default">But when system b=
oots, I still see /var/volatile/log and a symlink to it inside /var/log</di=
v><div class=3D"gmail_default"><div class=3D"gmail_default"><br></div><div =
class=3D"gmail_default">root@am335x-evm:~# ls -al /var/log/</div><div class=
=3D"gmail_default">drwxr-xr-x =C2=A0 =C2=A03 root =C2=A0 =C2=A0 root =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 Sep 17 00:05 .</div><div class=3D"gma=
il_default">drwxr-xr-x =C2=A0 =C2=A08 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 808 Sep 16 23:36 ..</div><div class=3D"gmail_default"=
>-rw-r--r-- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 23600 Sep 17 00:04 dmesg</div><div class=3D"gmail_default">-rw-r--r-- =
=C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2=
92 Sep 17 00:05 lastlog</div><div class=3D"gmail_default">lrwxrwxrwx =C2=A0=
 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01=
7 Sep 17 00:04 log -&gt; /var/volatile/log</div><div class=3D"gmail_default=
">-rw-r--r-- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 53389 Sep 17 00:05 messages</div><div class=3D"gmail_default">-rw-rw=
-r-- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A03456 Sep 17 00:05 wtmp</div><div class=3D"gmail_default"><br></div><div =
class=3D"gmail_default"><br></div></div></div><div class=3D"gmail_default" =
style=3D"font-family:georgia,serif;font-size:small;color:rgb(51,51,153)">Ho=
w to fix it ?</div><div class=3D"gmail_default" style=3D"font-family:georgi=
a,serif;font-size:small;color:rgb(51,51,153)"><br></div><div class=3D"gmail=
_default" style=3D"font-family:georgia,serif;font-size:small;color:rgb(51,5=
1,153)">thanks</div><div class=3D"gmail_default" style=3D"font-family:georg=
ia,serif;font-size:small;color:rgb(51,51,153)">Ankur</div>
</div>

--001a114786f0e42d45051fe8f4e9--
