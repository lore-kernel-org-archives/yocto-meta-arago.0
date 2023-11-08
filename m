Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1D7C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 13:15:56 +0000 (UTC)
Received: from egress-ip43b.ess.de.barracuda.com (egress-ip43b.ess.de.barracuda.com [18.185.115.247])
 by mx.groups.io with SMTP id smtpd.web10.13075.1699449351902784956
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 05:15:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=AMwmz0PI;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.247, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70]) by mx-outbound45-89.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 08 Nov 2023 13:15:48 +0000
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-507d0e4eedaso6610918e87.0
        for <meta-arago@lists.yoctoproject.org>; Wed, 08 Nov 2023 05:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1699449348; x=1700054148; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlGENOCUYID3t+lZWLBdhY2mtep2wxaG1Q0lBtxMcN8=;
        b=AMwmz0PIK7zhIJfYh+qKwbCYLNHIQ4tK4KxYSUYIzgiafOBd0pmQzyWXSvq/x5yePx
         cxTWwY+CaG+krxpt1y2/+1zIDeKEpcuQo/OIOzZ3mqu57yKFR5UkBt5YCqU61i+Xg55X
         tcKsKX/YembHrsVZY7Uc/lTvXXTeUCU/jjlkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699449348; x=1700054148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NlGENOCUYID3t+lZWLBdhY2mtep2wxaG1Q0lBtxMcN8=;
        b=ZAZj2pZ65cwJry5ABI8I88I/54H+hK1q3lTVDpSZPSeaFk7ln4isZ39sv6s3KYlreU
         34Yi+iMd3boC99eBUldYr7oU8pI8nYcJin/YEM7wstwYiKVohX7l9rJfg/uEdqNDsbUA
         cTAMxWPp1kDXds4sihJMMAq1SY3YQl4NH40FGrUH+mIkiV+bPgN4HCNeUtcMXOUnONms
         /9QFVA9Q81kDHTW2eR2kw3V+UGlntSa5SIVOghqeYpaRJ7T6kYe4s4g+b4HBixiqDbGZ
         aAURTR+8IskF+3Mff+fWfmPwk3j1l/8fgZ5zVea6GKC96BTVHqPTICPb+3XFYRfgFidy
         IbJA==
X-Gm-Message-State: AOJu0Yza5e+WFAcbHvxDuoeJWsg4T17REunByfgFpbhMA5Kv6Anx/N0k
	BbJBsLWY87DgEbVCmk6lGy35+itCuIB5bUOns3fCG+/Q9s6m0TL43drIhg6KTmzLhvTjRLieWhX
	AZQRLKOiA2r6iBO0e/vUhckNOyfUFjjtA1sf7V/hhFe3omaWx/qAgvbBef3WOGC1HJfdXQNUO1S
	BF4c0GrSI=
X-Received: by 2002:a05:6512:110f:b0:509:4523:4039 with SMTP id l15-20020a056512110f00b0050945234039mr1370437lfg.64.1699449347800;
        Wed, 08 Nov 2023 05:15:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsbgf3SM0MHlDxRfaSENPYUFfUHK2gXJJo82srcvOyJg18wLHsdyj/twximc+Gpm02YEHwpRJu5gSlmwdFfcM=
X-Received: by 2002:a05:6512:110f:b0:509:4523:4039 with SMTP id
 l15-20020a056512110f00b0050945234039mr1370397lfg.64.1699449347267; Wed, 08
 Nov 2023 05:15:47 -0800 (PST)
MIME-Version: 1.0
References: <20231025133351.3043121-1-s-adivi@ti.com>
In-Reply-To: <20231025133351.3043121-1-s-adivi@ti.com>
From: Sinthu Raja M <sinthu.raja@mistralsolutions.com>
Date: Wed, 8 Nov 2023 18:45:35 +0530
Message-ID: <CAEd-yTQ7ZB65YL24EhJE6WO3hdksTH5jgw4DpvAsBRCUmVY4yQ@mail.gmail.com>
Subject: Re: [meta-arago][kirkstone][PATCH v2] matrix-gui: handle systemd and
 sysvinit scripts separately
To: s-adivi@ti.com
Cc: meta-arago@lists.yoctoproject.org, praneeth@ti.com, denis@denix.org, 
	reatmon@ti.com, c-shilwant@ti.com, a-limaye@ti.com, g-gupta@ti.com, 
	khasim@ti.com, p-bhagat@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BESS-ID: 1699449348-311609-12575-664-1
X-BESS-VER: 2019.1_20231107.0004
X-BESS-Apparent-Source-IP: 209.85.167.70
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVqZGZgZAVgZQ0MDY0iw1OcnE0i
	DNJMUwzSIxLc3EwDjFzDDNLMXMMsVAqTYWAHa1z0lBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.251994 [from 
	cloudscan17-199.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Nov 2023 13:15:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15003

On Wed, Oct 25, 2023 at 7:04=E2=80=AFPM Sai Sree Kartheek Adivi via
lists.yoctoproject.org <s-adivi=3Dti.com@lists.yoctoproject.org> wrote:
>
> - Install systemd service file or init script based on the distro_feature=
s
> systemd/sysvinit.
> - systemd service also needs to depend on lighttpd service so that matrix
> won't start before the webserver.
>
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Acked-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
> v2: Handle both sysvinit and systemd
>
>  .../matrix/matrix-gui/matrix-gui-2.0.service      |  4 ++--
>  .../recipes-core/matrix/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a=
%2f%2fmatrix-gui_2.0.bb&c=3DE,1,uI-aTWTLE9ebq4R3RRhS3S8RX4mThQe73KXtJzBcCtL=
buT9CAfon0qUNsZaGAYmVEb7cr_NfkruorcLHBDi8AYtBCW2hrE-kRJZa5y3Skpd0&typo=3D1 =
        | 15 +++++++++------
>  2 files changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2=
.0.service b/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0=
.service
> index 40a8f0f9..462803f3 100644
> --- a/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.serv=
ice
> +++ b/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.serv=
ice
> @@ -1,6 +1,6 @@
>  [Unit]
>  Description=3DMatrix GUI
> -After=3Dweston.service
> +After=3Dweston.service lighttpd.service
>  Requires=3Dweston.service
>  Before=3Dhttps://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fgraphical=
.target&c=3DE,1,MPCJR5Y4V0RWJzSDnznRKN2ocAPgZGqc-8AanIuzWjQwtMXg4RzQOiBv1lf=
LcnGLmh4X1Webx5-n4SomRVgodrVDQJGczrNUthox4E9U-bkPoRTZtfoxsFUx&typo=3D1
>
> @@ -12,7 +12,7 @@ IgnoreSIGPIPE=3Dno
>  KillMode=3Dprocess
>  GuessMainPID=3Dno
>  RemainAfterExit=3Dyes
> -ExecStart=3D/etc/init.d/matrix-gui-2.0 start
> +ExecStart=3D/usr/share/matrix-gui-2.0/matrix-gui-2.0 start
>
>  [Install]
>  WantedBy=3Dhttps://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fmulti-u=
ser.target&c=3DE,1,FO2Ep-vm1QYUBkm_bcHCCXGwd7W8aDmv6B7saNjwSFd5K0QxebHludZW=
i273myKGPpfwX3GS-LvRbG7dqhbDZ4g_pyObIv0QgecW3MXn8A,,&typo=3D1
> diff --git a/meta-arago-demos/recipes-core/matrix/https://linkprotect.cud=
asvc.com/url?a=3Dhttps%3a%2f%2fmatrix-gui_2.0.bb&c=3DE,1,S1mPhUDq1Ebyj8vRVL=
jlNdDwKY8xkbXYVvHUkQQHm4y6npO3yg9CGl1d6ufzS-zT8CeAHTxsPXamdttlpNhlp3HDeWnSk=
V5C0HLnm4KKui4T&typo=3D1 b/meta-arago-demos/recipes-core/matrix/https://lin=
kprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fmatrix-gui_2.0.bb&c=3DE,1,0wzPiH=
CI02ttqigGTj-XVwcZ5pEiRSzuobJBNdwcbBa9GW2TmMRSzS3l0phNqekNzoq7jkyxwW7uq03K6=
PIR9m8OX2cS_jNWj6KPotaLQVRRsY4,&typo=3D1
> index 9299a929..508edb9b 100644
> --- a/meta-arago-demos/recipes-core/matrix/https://linkprotect.cudasvc.co=
m/url?a=3Dhttps%3a%2f%2fmatrix-gui_2.0.bb&c=3DE,1,EIwOZOJCxC7TXdt5ShejRgxes=
EuhZKooaS1Z-sBCwG8Hx03bBp4wobKMm98zjFzSBnII_qUdDvO-vc56huvTO90kNlUqmeWMSoA3=
7fdUL-xMEGio&typo=3D1
> +++ b/meta-arago-demos/recipes-core/matrix/https://linkprotect.cudasvc.co=
m/url?a=3Dhttps%3a%2f%2fmatrix-gui_2.0.bb&c=3DE,1,5NNhxGZ76cFnRRNxkiWeN706J=
Kr2IUXiUV-Zxl5bRk-T_i8lexVL7kpKEgdqbSTaFpqcukoC6_vxrlB2rm6N3NYBiyc7Obuh_0LH=
26hfC6xaTP_4unwtavgD2A,,&typo=3D1
> @@ -50,12 +50,15 @@ do_install(){
>         sed -i -e "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/" $=
{WORKDIR}/${MATRIX_INITSCRIPT}
>
>         # Install the script
> -       install -d ${D}${sysconfdir}/init.d
> -       install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT} ${D}${sysconfdir}=
/init.d/matrix-gui-2.0
> -
> -       # Install the systemd unit file
> -       install -d ${D}${systemd_system_unitdir}
> -       install -m 0644 ${WORKDIR}/matrix-gui-2.0.service ${D}${systemd_s=
ystem_unitdir}
> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'f=
alse', d)}; then
> +               install -d ${D}${sysconfdir}/init.d
> +               install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT} ${D}${sys=
confdir}/init.d/matrix-gui-2.0
> +       fi
> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'fa=
lse', d)}; then
> +               install -d ${D}${systemd_system_unitdir}
> +               install -m 0644 ${WORKDIR}/matrix-gui-2.0.service ${D}${s=
ystemd_system_unitdir}
> +               install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT} ${D}${MAT=
RIX_BASE_DIR}/matrix-gui-2.0
> +       fi
>  }
>
>  GUIDEPS =3D "${@bb.utils.contains('DISTRO_FEATURES','opengl',"matrix-gui=
-browser refresh-screen",'',d)}"
> --
> 2.34.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14970): https://linkprotect.cudasvc.com/url?a=3Dhttps=
%3a%2f%2flists.yoctoproject.org%2fg%2fmeta-arago%2fmessage%2f14970&c=3DE,1,=
82vhypDK5rcX-umeF_e4UOjCPwNB75UdQqbYYv1-nSkhKEbXGh6CMn4HucAoh7REp_1Rpon43EO=
IXc0TH3irBGQS6zkUsOaFfrkLyKBpuc3Sd8Ipu8nLzwk,&typo=3D1
> Mute This Topic: https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fli=
sts.yoctoproject.org%2fmt%2f102177988%2f6034914&c=3DE,1,ukl3wgz_kSGrKm0lK0K=
mDdu4t9PZ2iiZKZUhC64iQ88bKV_7ZIda6k3_j0l44OsGLbbT_l30kSLZU7Xol_37eMNJG0oZk0=
V0zbBUJJp_AkGNGg,,&typo=3D1
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.=
yoctoproject.org%2fg%2fmeta-arago%2funsub&c=3DE,1,R8Ie2IZt2c3x2MzraIFlKi_Md=
qxCs3S3VeXY06Wy6DrE6c-qS7aWvdj0aeKCz_NZiQgooQhjePvwLVm7hoyuA98r266f0LXHnuh8=
CNfrB6s,&typo=3D1 [sinthu.raja@mistralsolutions.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>


--=20
With Regards
Sinthu Raja

