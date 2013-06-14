Return-Path: <paul.kovitz@welchallyn.com>
Received: from na3sys009aog102.obsmtp.com (na3sys009aog102.obsmtp.com
	[74.125.149.69])
	by arago-project.org (Postfix) with ESMTPS id D75D952A65
	for <meta-arago@arago-project.org>;
	Fri, 14 Jun 2013 16:28:03 +0000 (UTC)
Received: from mail-pd0-f179.google.com ([209.85.192.179]) (using TLSv1) by
	na3sys009aob102.postini.com ([74.125.148.12]) with SMTP
	ID DSNKUbtEkcNyq9ne2UkaAd4P8ZUwxfoImugR@postini.com;
	Fri, 14 Jun 2013 09:28:03 PDT
Received: by mail-pd0-f179.google.com with SMTP id q10so728057pdj.24
	for <meta-arago@arago-project.org>;
	Fri, 14 Jun 2013 09:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=TmjPCl0PHtm4BR5KytFJXMGSk4MjjXJvJO7sASfEvPg=;
	b=ETMN0oMrE4OOx1/Su6U6XJnpLs4PKtmuz3wBgNJJ7xu0Fy6vVTDypcFNRd7m0j5Nj1
	7fW5CHW2AAq8Rs7bUCFzsDTiajhnr7/uzELqTQp77aSYlgIr/KH/lR6uGkLtZ6bI5imm
	ecyG49HyCBI3KG/aV5XNBx2Lk/7+7Pr+YS6RgDkIAEIkXQbiUr7BKDJILc68NIFLNslU
	9N2r71CIPMEE0xXWqVqAGktOSfof/+y25pAyDT4/vY84qL3K5DFRz3jSggs3Ue5SkJuM
	5QF9BRs/ElRHahHqLOiKVAq/mqxf6OQnsg08FuSvhJvd9tMm0k4xKYUHEbg2xMXeZpue
	YboA==
X-Received: by 10.68.252.227 with SMTP id zv3mr3370643pbc.14.1371227281183;
	Fri, 14 Jun 2013 09:28:01 -0700 (PDT)
X-Received: by 10.68.252.227 with SMTP id zv3mr3370625pbc.14.1371227280981;
	Fri, 14 Jun 2013 09:28:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.47.8 with HTTP; Fri, 14 Jun 2013 09:27:18 -0700 (PDT)
In-Reply-To: <20130613190647.GW3741@edge>
References: <20130613165457.GS3741@edge>
	<CA+edY+RB9HN0JsPJecU1MNO1-5biRUNFqiEW82_q+ztJDtXe7A@mail.gmail.com>
	<20130613190647.GW3741@edge>
From: Paul Kovitz <paul.kovitz@welchallyn.com>
Date: Fri, 14 Jun 2013 09:27:18 -0700
Message-ID: <CA+edY+S1cuYX1c7XJU5K13mRUXcNu+XcL7KsEPFOTSCKA7kn0g@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
X-Gm-Message-State: ALoCoQnnVx8DNfBWhjYh4g5/3OEckaNs1VQcomWNWJvs9NjPqwaQtGBx+nX3hQOYZYQuK5GmoFmomPALnFlD3795/ZJLKzY1UTrJiBgdR1n55y5kxnnUjamIMOmnf63JB0O+zS5hjCrVfTaqIy7rBosW97JGoXX8uUaR4icllfLt4ehBHFLemP8=
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Updated Core TI-SDK setup and build instructions
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
X-List-Received-Date: Fri, 14 Jun 2013 16:28:09 -0000
Content-Type: multipart/alternative; boundary=047d7b2e0a57fd54dd04df1fba6f

--047d7b2e0a57fd54dd04df1fba6f
Content-Type: text/plain; charset=ISO-8859-1

I see the metadata file revisions are locked down. Still I have questions.

I ran the oe-layertool-setup.sh script but still there are recipes, the
ltp-ddt .bbappend files in
sources/meta-arago/meta-arago-distro/recipes-devtools/ltp-ddt, that have
SRCREV = "{AUTOREV}".

I expected the automatically generated local.conf to contain something like
SRCREV_pn-ltp-ddt = "70e324b8352e817485cc5e6865341c1a40118f78" (or some
such SHA1) so I know I build the same ltp-ddt that was used to generate the
SDK.

Did I miss a step? Is there a configuration file somewhere else I did not
find? To get the sources for the bitbake metadata, I ran

git clone git://arago-project.org/git/projects/oe-layersetup.git amsdk
cd amsdk
/oe-layertool-setup.sh -f configs/amsdk/amsdk-05.07.00.00-config.txt

Also, in meta-arago-extras/recipes-connectivity/wpa-supplicant/
wpa-supplicant_r5.00.18.bb,
meta-arago-extras/recipes-connectivity/wpa-supplicant/
wpa-supplicant_r5.sp4.01.bb,
meta-arago-extras/recipes-bsp/ti-compat-wireless/
ti-compat-wireless-wl12xx_r5.sp4.01.bb and
meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_r5.00.18.bbthere
are SRCREV = "git tag" instead of a SHA1. This makes it harder to
make a local source mirror. Would it be possible in the future releases to
use the SHA1 and have a comment explaining the tag?

Thanks for your help.

--047d7b2e0a57fd54dd04df1fba6f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style><span style=3D"color:rgb(80,0,80)">I see the me=
tadata file revisions are locked down.=A0</span><font color=3D"#500050">Sti=
ll I have questions.=A0</font></div><div><font color=3D"#500050"><br></font=
></div><div>

<font color=3D"#500050">I ran the oe-layertool-setup.sh script but still th=
ere are recipes, the ltp-ddt .bbappend files in sources/meta-arago/meta-ara=
go-distro/recipes-devtools/ltp-ddt, that have SRCREV =3D &quot;{AUTOREV}&qu=
ot;.</font></div>

<div><font color=3D"#500050"><br></font></div><div><font color=3D"#500050">=
I expected the automatically generated local.conf to contain something like=
 SRCREV_pn-ltp-ddt =3D &quot;70e324b8352e817485cc5e6865341c1a40118f78&quot;=
 (or some such SHA1) so I know I build the same ltp-ddt that was used to ge=
nerate the SDK.</font></div>

<div><font color=3D"#500050"><br></font></div><div><font color=3D"#500050">=
Did I miss a step? Is there a configuration file somewhere else I did not f=
ind? To get the sources for the bitbake metadata, I ran</font></div><div><f=
ont color=3D"#500050"><br>

</font></div><div><font color=3D"#500050">git clone git://<a href=3D"http:/=
/arago-project.org/git/projects/oe-layersetup.git">arago-project.org/git/pr=
ojects/oe-layersetup.git</a> amsdk</font></div><div><font color=3D"#500050"=
>cd amsdk</font></div>

<div><font color=3D"#500050">/oe-layertool-setup.sh -f configs/amsdk/amsdk-=
05.07.00.00-config.txt</font></div><div><font color=3D"#500050"><br></font>=
</div><div><font color=3D"#500050">Also, in meta-arago-extras/recipes-conne=
ctivity/wpa-supplicant/<a href=3D"http://wpa-supplicant_r5.00.18.bb">wpa-su=
pplicant_r5.00.18.bb</a>, meta-arago-extras/recipes-connectivity/wpa-suppli=
cant/<a href=3D"http://wpa-supplicant_r5.sp4.01.bb">wpa-supplicant_r5.sp4.0=
1.bb</a>, meta-arago-extras/recipes-bsp/ti-compat-wireless/<a href=3D"http:=
//ti-compat-wireless-wl12xx_r5.sp4.01.bb">ti-compat-wireless-wl12xx_r5.sp4.=
01.bb</a> and meta-arago-extras/recipes-connectivity/hostap/<a href=3D"http=
://hostap-daemon_r5.00.18.bb">hostap-daemon_r5.00.18.bb</a> there are SRCRE=
V =3D &quot;git tag&quot; instead of a SHA1. This makes it harder to make a=
 local source mirror. Would it be possible in the future releases to use th=
e SHA1 and have a comment explaining the tag?</font></div>

<div><font color=3D"#500050"><br></font></div><div style><font color=3D"#50=
0050">Thanks for your help.</font></div><div class=3D"gmail_extra">
</div></div>

--047d7b2e0a57fd54dd04df1fba6f--
