Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by arago-project.org (Postfix) with ESMTPS id C897F5209B
	for <meta-arago@arago-project.org>;
	Thu,  6 Aug 2015 02:48:13 +0000 (UTC)
Received: by obnw1 with SMTP id w1so46075109obn.3
	for <meta-arago@arago-project.org>;
	Wed, 05 Aug 2015 19:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=0krwFiBypJ07gI+ucvzmmgyjXj1m+yA8L0pufPNwSqg=;
	b=A5BAIXcSyPNoni4rMyzKduGPg9Qi4fC+8ZTykOR8ifuGVNAg4QmPSGw3eRJyhNLWVY
	75vCy/WSuLWKRMbzL1yoDsudfJwlX2RFyA0yOHoZ1nc80YiqTHj+pzOJf90mjdVcscDC
	JiJ+BEg4pIAkSNXckSJLKGVNf61uPPAKtzwk+cqXZ6g8x3O0cyzHoVTl2+J10w200Q9D
	CwK9is5ZPQrrEEL6dzR02Qu9+LuWz+e0Auq++yqbm/pFTP+Z3x+idE9OHk0Kr5AH7sq9
	Wt/BePpeM57dUPlC0iinstVKHU0JArTpxoOj3ZpX3BSDuQxRntErbydeikyjQI7NmM7q
	DS7w==
X-Received: by 10.182.246.9 with SMTP id xs9mr10877527obc.45.1438829292858;
	Wed, 05 Aug 2015 19:48:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.93.69 with HTTP; Wed, 5 Aug 2015 19:47:53 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 6 Aug 2015 14:47:53 +1200
Message-ID: <CADySD0HL5aWPO+N3KfR=89cQnuMyxmBDpFo2O1kntcL29R0uPw@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: omap3-sgx-modules-5.01.01.xx ONLY supports hardfp mode for now
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
X-List-Received-Date: Thu, 06 Aug 2015 02:48:14 -0000
Content-Type: multipart/alternative; boundary=001a11c306eee4b3d6051c9b8c99

--001a11c306eee4b3d6051c9b8c99
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=E2=80=8B
Hi,

I am using TI AM335x-EVM kit and while building image using
"arago-daisy-config.txt", I saw this warning :

omap3-sgx-modules-5.01.01.02 ONLY supports hardfp mode for now
omap3-sgx-modules-5.01.01.01 ONLY supports hardfp mode for now

and TUNE_FEATURE
=E2=80=8B =E2=80=8B
is "vfp"

Does that mean GPU is not getting used anymore ?
I am using QT5 with eglfs platform and need GPU support for performance.

Please clarify the situation.

Thanks
Ankur

--001a11c306eee4b3d6051c9b8c99
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:#333399"><div class=3D"gmail_default" style=3D"=
display:inline">=E2=80=8B</div><font color=3D"#333399" face=3D"georgia, ser=
if">Hi,</font><br></div><div><div class=3D"gmail_signature"><div dir=3D"ltr=
"><font color=3D"#333399" face=3D"georgia, serif"><br></font></div><div dir=
=3D"ltr"><font color=3D"#333399" face=3D"georgia, serif">I am using TI AM33=
5x-EVM kit and while building image using &quot;arago-daisy-config.txt&quot=
;, I saw this warning :</font></div><div dir=3D"ltr"><font color=3D"#333399=
" face=3D"georgia, serif"><br></font></div><div dir=3D"ltr"><font color=3D"=
#333399" face=3D"georgia, serif">omap3-sgx-modules-5.01.01.02 ONLY supports=
 hardfp mode for now</font></div><div dir=3D"ltr"><font color=3D"#333399" f=
ace=3D"georgia, serif">omap3-sgx-modules-5.01.01.01 ONLY supports hardfp mo=
de for now</font></div><div dir=3D"ltr"><font color=3D"#333399" face=3D"geo=
rgia, serif"><br></font></div><div dir=3D"ltr"><font color=3D"#333399" face=
=3D"georgia, serif">and TUNE_FEATURE<div class=3D"gmail_default" style=3D"f=
ont-family:georgia,serif;font-size:small;color:rgb(51,51,153);display:inlin=
e">=E2=80=8B =E2=80=8B</div>is &quot;vfp&quot;</font></div><div dir=3D"ltr"=
><font color=3D"#333399" face=3D"georgia, serif"><br></font></div><div dir=
=3D"ltr"><font color=3D"#333399" face=3D"georgia, serif">Does that mean GPU=
 is not getting used anymore ?</font></div><div dir=3D"ltr"><font color=3D"=
#333399" face=3D"georgia, serif">I am using QT5 with eglfs platform and nee=
d GPU support for performance.</font></div><div dir=3D"ltr"><font color=3D"=
#333399" face=3D"georgia, serif"><br></font></div><div dir=3D"ltr"><font co=
lor=3D"#333399" face=3D"georgia, serif">Please clarify the situation.</font=
></div><div dir=3D"ltr"><font color=3D"#333399" face=3D"georgia, serif"><br=
></font></div><div dir=3D"ltr"><font color=3D"#333399" face=3D"georgia, ser=
if">Thanks</font></div><div dir=3D"ltr"><font color=3D"#333399" face=3D"geo=
rgia, serif">Ankur</font></div></div></div>
</div>

--001a11c306eee4b3d6051c9b8c99--
