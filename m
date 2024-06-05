Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8438CC25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 07:09:25 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.8977.1717571358443016035
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Jun 2024 00:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=rgvHFkvJ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45579FOM026322;
	Wed, 5 Jun 2024 02:09:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717571355;
	bh=PQzfgWGBmHRrCaZP6RD7+AsaE8dtRsYVqg/kvpyNXC0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rgvHFkvJ35Q+yWmR1DjyLwwUZdWRD1WV5wWAIk8Wf6oGzUrvEAOTW6eMRzXiUadDy
	 xW6Rd8rv09/owWpWM5hVWCudcP8QWnEqXT6a28hsxgbPTU8+nH9JZ/DTvylSSPB6nZ
	 Eb2avy9j3aJpT2Mm/82LamnFiGctXaV+FHNCbpCY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45579Fn3107638
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Jun 2024 02:09:15 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jun 2024 02:09:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jun 2024 02:09:14 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45579CUB036089;
	Wed, 5 Jun 2024 02:09:13 -0500
Message-ID: <8bcec881-5203-4b4f-b91f-cdd0ecadb269@ti.com>
Date: Wed, 5 Jun 2024 12:39:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-arago][master/scarthgap][PATCH] recipes-qt:
 qt5: Add xkbcommon to qtbase PACKAGECONFIG
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        Gyan
 Gupta <g-gupta@ti.com>
References: <20240603092255.2930095-1-c-shilwant@ti.com>
 <20240604160805.GN21287@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240604160805.GN21287@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 45579FOM026322
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Jun 2024 07:09:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15367

Hi Denys & Ryan,

On 04/06/24 21:38, Denys Dmytriyenko wrote:
> On Mon, Jun 03, 2024 at 02:=E2=80=8A52:=E2=80=8A55PM +0530, Chirag Shil=
want via=20
> lists.=E2=80=8Ayoctoproject.=E2=80=8Aorg wrote: > From: Sai Sree Karthe=
ek Adivi=20
> <s-adivi@=E2=80=8Ati.=E2=80=8Acom> > > - For QT apps to use physical ke=
yboard,=20
> xkbcommon has to be added in > PACKAGECONFIG.=E2=80=8A
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe. If you wish to report this=20
> message to IT Security, please forward the message as an attachment to=20
> phishing@list.ti.com
> ZjQcmQRYFpfptBannerEnd
> On Mon, Jun 03, 2024 at 02:52:55PM +0530, Chirag Shilwant via lists.yoc=
toproject.org wrote:
> > From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> >=20
> > - For QT apps to use physical keyboard, xkbcommon has to be added in
> > PACKAGECONFIG. This was supported until 09.01 using xkbcommon-evdev w=
hich at
> > present is an invalid PACKAGECONFIG & hence was dropped from meta-ara=
go [1].
> >=20
> > - Hence, add xkbcommon to PACKAGECONFIG which will enable the use of
> > physical keyboard in QT apps.
> >=20
> > [1]: https://git.ti.com/cgit/arago-project/meta-arago/commit/?h=3Dsca=
rthgap&id=3Dde16946741249265a38acb7bb503b39a0c2b4175
> >=20
> > Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> > ---
> >  meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/met=
a-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> > index b1205b5a..6f94c574 100644
> > --- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> > +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> > @@ -4,6 +4,8 @@ GLES_EXTRA_DEPS =3D "libdrm wayland"
> > =20
> >  PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2 virtu=
al/egl ${GLES_EXTRA_DEPS}"
> > =20
> > +PACKAGECONFIG:append:k3 =3D " xkbcommon"
>
> This would make the package machine-specific - why is it only applicabl=
e to k3?


For non k3 based platforms, with the removal of Matrix GUI I don't see
any QT Demos under meta-arago-demos which might need the keyboard
functionality [Ryan correct me if we have any QT demo applicable for
non k3 based platform which needs keyboard].

For k3 platforms, we have TI Apps Launcher (a QT based OOB demo) for whic=
h
xkbcommon is needed & hence I made this change machine specific.


Btw, Denys do you have any background on why does meta-qt5 just in case=20
of Wayland doesn't
support this keyboard enablement by default though I see for x11 they=20
add 'xkbcommon' in
PACKAGECONFIG by default [1]

[1]:=20
https://github.com/meta-qt5/meta-qt5/blob/scarthgap/recipes-qt/qt5/qtbase=
_git.bb#L70


>
>
> > +
> >  PR:append =3D ".arago17"
> > =20
> >  QT_CONFIG_FLAGS +=3D "-qpa ${@bb.utils.contains('DISTRO_FEATURES', '=
wayland', 'wayland', 'eglfs', d)}"
> > --=20
> > 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15363):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15363__;!!G3vK!U1uBDrnNmtKx_ghron2byd=
fbtiqixyS9bxFpUcM0WW7z8YnnzCnJevihs-oyB3LGUASSqeVfviQr$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/106458499/7030289__;!!G3vK!U1uBDrnNmtKx_ghron2bydfbtiqixyS9bxFpUcM=
0WW7z8YnnzCnJevihs-oyB3LGUASSqUVsMvoz$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!U1uBDrnNmtKx_ghron2bydfbtiqixyS9bxFpUcM0WW7z8=
YnnzCnJevihs-oyB3LGUASSqSobwslI$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

