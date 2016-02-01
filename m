Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by arago-project.org (Postfix) with ESMTPS id 0076152092
	for <meta-arago@arago-project.org>;
	Mon,  1 Feb 2016 21:46:02 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id e6so85194519vkh.2
	for <meta-arago@arago-project.org>;
	Mon, 01 Feb 2016 13:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=eXqHL6NhOtgyveBPmyhzx8E3HL+tEM+EWfguChTB/6c=;
	b=mVXKGTELh9DeaFJ7hbrgSfsSFzrzedXmesfShpxu0MCcuzGhP17n5Xllr+gcPMJbb+
	fuKImZl+AsTlNK0HpPJIFohBqERkKR8KYBxfSYkCIb+TSesv5o/MYVJcZWD42aOEVH+G
	Y7hQK+8JeZs29NXID0Ei6/p1lUjWWrBg/onzCPu1ifDX3C1MMGSfcBA2Bqe1OJx8JQn5
	UbpBbrNQMNnkiej1aA7/PAs4BcUTiMSZ0qT0TiGAaMdQ+NvCBYyRagxfFshTubI6TdG5
	rnpLgfnjP1tn0sFSGQX/VTaaepR3OrE2Ze7G1EXY/0UX6yKf0jFJ6lOhAFeJc6swRJhS
	WM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=eXqHL6NhOtgyveBPmyhzx8E3HL+tEM+EWfguChTB/6c=;
	b=Hkf7CDu0P/XyIVoHu01mXCKhh8bVug+n8eaMNHSNWHcrNPMBWxifNu7a036xJPFxbO
	0FM/mkus+uPJCq60MX0rq/en0PMiU9fVBP+8CnwNsJZuZm5Vfty77lDb9U6qy9VMl6BL
	QRmkqIBV7a+0weOqnWOBMcNq5Eq05rYmeJ7JLccnD8q/XqYv0f/ljzM0pCNHvLDpfrS7
	aOxujTvun5OUNWpM564M4vwpoAodvF4vm1WYysmVV8bzTHK0FuNisP+Uxxm1bKUdtgmO
	LQ0eCGiXUYh6DgrNaW94FtOXve+S5eGSeAP49KlZII6X/MAANpjdlSdvI9JWWwIgwRLw
	sS0w==
X-Gm-Message-State: AG10YOQwqGh2UDjeGm8x7J0RxxQtdtRbsT2dhHnoSyr+7bR+VC2AocBw5VDnOA4FXfKKcMFo/pKsb0cj4YsvIQ==
X-Received: by 10.31.48.132 with SMTP id w126mr18381437vkw.5.1454363162477;
	Mon, 01 Feb 2016 13:46:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.146.65 with HTTP; Mon, 1 Feb 2016 13:45:43 -0800 (PST)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 2 Feb 2016 10:45:43 +1300
Message-ID: <CADySD0FB8Y_f9SWK+=WDmb8tba=mUZ==PK-spO+_BOhR4QhVsQ@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: What's the reason behind different config file in oe-layersetup
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
X-List-Received-Date: Mon, 01 Feb 2016 21:46:03 -0000
Content-Type: multipart/alternative; boundary=001a11430e0eac8c8e052abc4f13

--001a11430e0eac8c8e052abc4f13
Content-Type: text/plain; charset=UTF-8

Hi,

oe-layersetup has different set of configs. I couldn't find any
documentation explaining "when to use which config".

Can someone help me understand the rationale behind these configs ? They
all refer to different commits of same repo, so I am sure there must a
reason behind it.

For a commercial product, which config should be used to create bsp, kernel
and rootfs

thanks
Ankur

--001a11430e0eac8c8e052abc4f13
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:#333399">Hi,</div><div class=3D"gmail_default" =
style=3D"font-family:georgia,serif;font-size:small;color:#333399"><br></div=
><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:=
small;color:#333399">oe-layersetup has different set of configs. I couldn&#=
39;t find any documentation explaining &quot;when to use which config&quot;=
.</div><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font=
-size:small;color:#333399"><br></div><div class=3D"gmail_default" style=3D"=
font-family:georgia,serif;font-size:small;color:#333399">Can someone help m=
e understand the rationale behind these configs ? They all refer to differe=
nt commits of same repo, so I am sure there must a reason behind it.</div><=
div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:sm=
all;color:#333399"><br></div><div class=3D"gmail_default" style=3D"font-fam=
ily:georgia,serif;font-size:small;color:#333399">For a commercial product, =
which config should be used to create bsp, kernel and rootfs</div><div clas=
s=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;colo=
r:#333399"><br></div><div class=3D"gmail_default" style=3D"font-family:geor=
gia,serif;font-size:small;color:#333399">thanks</div><div class=3D"gmail_de=
fault" style=3D"font-family:georgia,serif;font-size:small;color:#333399">An=
kur</div>
</div>

--001a11430e0eac8c8e052abc4f13--
