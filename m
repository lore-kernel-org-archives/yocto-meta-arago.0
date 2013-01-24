Return-Path: <paul.kovitz@welchallyn.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by arago-project.org (Postfix) with ESMTPS id 0564B52A69
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 18:08:55 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id hz1so5655170pad.40
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 10:08:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=58bUFo+evOSt4KlrJVJLuZOQKXUBUxB/OBxh2TZ1GLc=;
	b=dh3t3tOic3XG4AxO2UUj+GEuMhy0W3mAlf81YPBZ/zYP9PM95gUFjdlMEs1Sm31z6y
	+BTuxWOF/qQ/fv94lXKPih202wyFKlSAhFdFduiNTQOD+HQaBosvxcMu5I4URrPZfOsh
	0UUXykrdUuojatbSGBPM/ZVJ3jtimB2cBfZxRAXij/soBBQ8Aq3Oa8MtRNJsiyjQxMhC
	YePQXLpnhr4ep70eyi28azfFaYsZn/dom3Xe04hYRNkYoYXVKo3lbtdW1vDwpFfs1jSA
	5SRgYUmKfeyMYZRIEAoxNh4xbazWZygYtXW1UJ9Kh4nk/PkYSrKEhjrwNsUVKUx33xqa
	wrVw==
X-Received: by 10.68.243.33 with SMTP id wv1mr7207563pbc.143.1359050934345;
	Thu, 24 Jan 2013 10:08:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.68.73.106 with HTTP; Thu, 24 Jan 2013 10:08:14 -0800 (PST)
From: Paul Kovitz <paul.kovitz@welchallyn.com>
Date: Thu, 24 Jan 2013 10:08:14 -0800
Message-ID: <CA+edY+Svcn3OkAAO+U_cz8+NZBA9TxbR3f532G2nPNYQHXMm1A@mail.gmail.com>
To: meta-arago@arago-project.org
X-Gm-Message-State: ALoCoQkwmXIXEZ2X1Am5bBQP0j2qaXFXc7T1INZGLyN77gAxCaHze4d0bvN2WrxOPQmrb0fijN+Z
Subject: newbie question: what is the best way to make sure bitbake uses bash instead of dash?
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
X-List-Received-Date: Thu, 24 Jan 2013 18:08:56 -0000
Content-Type: multipart/alternative; boundary=047d7b2e14712c60a004d40cb4a7

--047d7b2e14712c60a004d40cb4a7
Content-Type: text/plain; charset=ISO-8859-1

The do_install step will fail to install the toolchain libraries unless you
have bash as the default shell. Making the default system shell bash hurts
boot time according to some data I have seen. Right now I used sudo
dpkg-reconfigure dash to make the default bash. Is there a better way? If
there is no better way, should the oe-layersetup.sh script do it for you if
$SHELL is not /bin/bash?

-- 
Paul Kovitz

--047d7b2e14712c60a004d40cb4a7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The do_install step will fail to install the toolchain lib=
raries unless you have bash as the default shell. Making the default system=
 shell bash hurts boot time according to some data I have seen. Right now I=
 used=A0sudo dpkg-reconfigure dash to make the default bash. Is there a bet=
ter way? If there is no better way, should the oe-layersetup.sh script do i=
t for you if $SHELL is not /bin/bash?<div>

<br></div>-- <br>Paul Kovitz<div><br></div>
</div>

--047d7b2e14712c60a004d40cb4a7--
