Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by arago-project.org (Postfix) with ESMTPS id E0F16529A4
	for <meta-arago@arago-project.org>;
	Tue,  8 Sep 2020 21:51:53 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id n22so598633edt.4
	for <meta-arago@arago-project.org>;
	Tue, 08 Sep 2020 14:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ZKx99aP5C0oDP4msA1WNNlTkYcAOhI6YWPx4jV0xOhs=;
	b=CvSbeGlsbpgyt8dB2VTcvczwa7CgE39/5+Qn2efh2brHmco1OdO46pHR7+Nga9I+a9
	7sfrCfBKWtpiU2pU6QTmq+qbkjyLjSeJSLRIka2kYRl5ylhUZHuo/jr0oqla31D6yZhU
	Y/PJ3fs77EWGDoEoIlctHxE6is4fshk7rLRR+MyYMHqeHNSal1Uu5lOtvNm0cOlT7I2b
	vFRR4UJIbMiBeJN2kYDsci5T6kW+VkRKpgSFaOQBv5XeabpZCFv2gOrm/3r6DSdAkaPv
	QVLJMUru5zJd5qzdrkeGIgt0frggGA7kjDVz+7k9MV5qcPGIo3YRsFIsukcmahK3e+4G
	34BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ZKx99aP5C0oDP4msA1WNNlTkYcAOhI6YWPx4jV0xOhs=;
	b=lNVutdar2pQ3h4fiTia3UeURRGbs+LwTeXoPKd+1j1VqTG9ZmbCipmF4rsJwW8Rbi+
	r7R6jQL0LQjaBpZFBTCsCEpTRw+qlhdYCvn+8mo2fxt92gFQEJHhRGAGqd0mkyF39gbh
	ViMtgFB6w8n5qeUup5VFksv604T/l8wpN9F0lkE9B0gA0CZy6bNLJc7FdyDEBKqIWAm7
	kM2HUet48PJ/nvx51TiG6G+Iqar7mhCEs2v/sVxzIR2u2EVeGTHaKS9q7ivlGHqFg/WL
	CD0hJK9icHuQX+86pVCLgJBi/tQPBISq+5O3tBWIbrkzmosIceui36zq6SEU+G5Yp4G3
	PgmQ==
X-Gm-Message-State: AOAM531a5+k7ZMh9NbSbUhnPHGiq4On1YywXRoBTb33pxNUuoNKX5Xfj
	/Y0BX+z8FKzHpD7+OGp2E8r62Gd/8QPuC+NbViHUlYLvDDBTN2ye
X-Google-Smtp-Source: ABdhPJwtv7eP6tUSKh1zUmBfg59yZivLI3bHOE0VJ8eDJNZn5TABlz9IrGGe2GO10LGQLPj3rfF8L/8yKa5m05QxuHQ=
X-Received: by 2002:a50:f081:: with SMTP id v1mr1122672edl.161.1599601739328; 
	Tue, 08 Sep 2020 14:48:59 -0700 (PDT)
MIME-Version: 1.0
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 9 Sep 2020 09:48:48 +1200
Message-ID: <CADySD0FjDncw6wnd2c5jWa9Pxy8bAaUtJgXYz3rVzw93EW9ABg@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Arago wiki page is not up to date
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
X-List-Received-Date: Tue, 08 Sep 2020 21:51:54 -0000
Content-Type: multipart/alternative; boundary="00000000000074752505aed44d38"

--00000000000074752505aed44d38
Content-Type: text/plain; charset="UTF-8"

Hi,

Arago build environment wiki page refers to the rocko branch whereas the
current branch is dunfell.
http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment

Can it please be updated as per the latest setup

regards
Ankur

--00000000000074752505aed44d38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif">Hi,</div><div class=3D"gmail_default" style=3D"font-family:verd=
ana,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-family=
:verdana,sans-serif">Arago build environment wiki page refers to the rocko =
branch whereas the current branch is dunfell.</div><div class=3D"gmail_defa=
ult" style=3D"font-family:verdana,sans-serif"><a href=3D"http://arago-proje=
ct.org/wiki/index.php/Setting_Up_Build_Environment">http://arago-project.or=
g/wiki/index.php/Setting_Up_Build_Environment</a></div><div class=3D"gmail_=
default" style=3D"font-family:verdana,sans-serif"><br></div><div class=3D"g=
mail_default" style=3D"font-family:verdana,sans-serif">Can it please be upd=
ated as per the latest setup</div><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif"><br></div><div class=3D"gmail_default" style=
=3D"font-family:verdana,sans-serif">regards</div><div class=3D"gmail_defaul=
t" style=3D"font-family:verdana,sans-serif">Ankur</div></div>

--00000000000074752505aed44d38--
