Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by arago-project.org (Postfix) with ESMTPS id 126625208B
	for <meta-arago@arago-project.org>;
	Tue, 15 Dec 2015 10:27:02 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id a189so2483530vkh.2
	for <meta-arago@arago-project.org>;
	Tue, 15 Dec 2015 02:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=Dg6BSzZZSuP5darN/mXrxuetp4fliT3uXXGwo+UDDQk=;
	b=zsFS4TViLbYdBMD3xstVsYi+HQsGtVK2yCBzEXzHKuwiWKwRjHoCFh8c84vy06G5s0
	QMxdMttYUEOGFKaWdYehomx7AV7Z7pLNWYaUnI2Wurs5Dc+fEJhzyYY11Vq4aAUevr6I
	39VUwLMlwmcD9AvEqe3vn21Ul+mVe7a5PpISEbcyU9WyI5L456pppsvcW7nFin8epUcV
	sQgPPxVDiSWi/O/8DTK3/d4biDFOfqbXq0qP1bq8Rq/Jkp4FRU6A4/8jMXke1Vmlve4R
	ozO025zL1EZettJ4UXWMkHi8o6A9JpFVw0BHWTKmhCp/shvRzrfgK/VIO2Iwxj5ck2ZS
	4d6A==
X-Received: by 10.31.147.81 with SMTP id v78mr26453627vkd.58.1450175220872;
	Tue, 15 Dec 2015 02:27:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Tue, 15 Dec 2015 02:26:41 -0800 (PST)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 15 Dec 2015 23:26:41 +1300
Message-ID: <CADySD0GvzsFS2gdsxhkvXAzRk2NTaGP0hiAX0=eiGDSRy9uz4w@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: QT5 application NOT generating core dump upon receiving segmentation fault
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
X-List-Received-Date: Tue, 15 Dec 2015 10:27:03 -0000
Content-Type: multipart/alternative; boundary=001a1141f7f2e6fcc10526ed3a59

--001a1141f7f2e6fcc10526ed3a59
Content-Type: text/plain; charset=UTF-8

 Hi,

I am running a QT5 based application on TI AM335x EVM kit. I am using
meta-arago daisy configuration.

My system is configured to generate core dump and core dumps are generated
whenever application receives segmentation fault (expected).

But when my QT5 based application received SIGSEGV, then no core dump is
generated. It dies without "Segmentation fault" message on stdout.

To debug this further, I added nullptr dereference in my application main()
before QApplication object is created and when executed, core dump was
created.
When I moved nullptr dereference after QApplication object is created, then
no core dump was created. Application died without any message.

So it seems QT is handling SIGSEGV and not allowing to create core dump.

Is it expected ? I believe not. What wrong am I doing and how to fix this ?

thanks
Ankur

--001a1141f7f2e6fcc10526ed3a59
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:#333399">=C2=A0Hi,</div><div class=3D"gmail_def=
ault" style=3D"font-family:georgia,serif;font-size:small;color:#333399"><br=
></div><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font=
-size:small;color:#333399">I am running a QT5 based application on TI AM335=
x EVM kit. I am using meta-arago daisy configuration.</div><div class=3D"gm=
ail_default" style=3D"font-family:georgia,serif;font-size:small;color:#3333=
99"><br></div><div class=3D"gmail_default" style=3D"font-family:georgia,ser=
if;font-size:small;color:#333399">My system is configured to generate core =
dump and core dumps are generated whenever application receives segmentatio=
n fault (expected).</div><div class=3D"gmail_default" style=3D"font-family:=
georgia,serif;font-size:small;color:#333399"><br></div><div class=3D"gmail_=
default" style=3D"font-family:georgia,serif;font-size:small;color:#333399">=
But when my QT5 based application received SIGSEGV, then no core dump is ge=
nerated. It dies without &quot;Segmentation fault&quot; message on stdout.<=
/div><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-s=
ize:small;color:#333399"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-family:georgia,serif;font-size:small;color:#333399">To debug this furthe=
r, I added nullptr dereference in my application main() before QApplication=
 object is created and when executed, core dump was created.</div><div clas=
s=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;colo=
r:#333399">When I moved nullptr dereference after QApplication object is cr=
eated, then no core dump was created. Application died without any message.=
</div><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-=
size:small;color:#333399"><br></div><div class=3D"gmail_default" style=3D"f=
ont-family:georgia,serif;font-size:small;color:#333399">So it seems QT is h=
andling SIGSEGV and not allowing to create core dump.</div><div class=3D"gm=
ail_default" style=3D"font-family:georgia,serif;font-size:small;color:#3333=
99"><br></div><div class=3D"gmail_default" style=3D"font-family:georgia,ser=
if;font-size:small;color:#333399">Is it expected ? I believe not. What wron=
g am I doing and how to fix this ?</div><div class=3D"gmail_default" style=
=3D"font-family:georgia,serif;font-size:small;color:#333399"><br></div><div=
 class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small=
;color:#333399">thanks</div><div class=3D"gmail_default" style=3D"font-fami=
ly:georgia,serif;font-size:small;color:#333399">Ankur</div>
</div>

--001a1141f7f2e6fcc10526ed3a59--
