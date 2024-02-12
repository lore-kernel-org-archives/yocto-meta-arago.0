Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1872C48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 05:00:46 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.365.1707714042491814534
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 11 Feb 2024 21:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=A35NzP0k;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41C50dfe046158;
	Sun, 11 Feb 2024 23:00:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707714039;
	bh=tEoA7DzOiCzgkMkmuhclyhtxT2fkhVJiIHAPvVqZwEw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=A35NzP0kBJ7bWqkFB/GKF5fgjEZdfCcGRDZKMgcF8AsOU/ar+/k9Ewg1vIpfWSGd1
	 Pvk99ZXPaBhREbhip7TD0OgdYCKevOsdLP4CyDQaG6163EhoMPzHXVJs6hutQRz/+2
	 T49Ld+QMo0dS3z/Av4loMDh5hssNU4XgSdiZUZhE=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41C50d0w098508
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 11 Feb 2024 23:00:39 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 11
 Feb 2024 23:00:38 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 11 Feb 2024 23:00:38 -0600
Received: from [172.24.227.88] (uda0500640.dhcp.ti.com [172.24.227.88])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41C50ZdD030276;
	Sun, 11 Feb 2024 23:00:36 -0600
Message-ID: <8f19baa4-192a-cdfd-cd5a-49674c15b84b@ti.com>
Date: Mon, 12 Feb 2024 10:30:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXTERNAL] [meta-arago] [master/kirkstone][PATCH]
 meta-arago-extras: sysrepo: Update netopeer and sysrepo to start under
 systemd
Content-Language: en-US
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>, <praneeth@ti.com>,
        <srk@ti.com>, Ravi Gunasekaran <r-gunasekaran@ti.com>
References: <20240209103337.25332-1-r-gunasekaran@ti.com>
 <fee79e2d-e00b-4ec8-9304-eeeb7d9997e7@ti.com>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <fee79e2d-e00b-4ec8-9304-eeeb7d9997e7@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 41C50dfe046158
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 12 Feb 2024 05:00:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15159

Chirag,

On 2/9/24 4:32 PM, Chirag Shilwant wrote:
> Hi Ravi,
>=20

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/etc/sysrepo/data/notifi=
cations
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/etc/sysrepo/yang
>> @@ -29,6 +39,13 @@ do_install:append () {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -o root -g root ${S}/modules/ie=
tf-netconf-with-defaults.yang ${D}/etc/sysrepo/yang/ietf-netconf-with-def=
aults@2011-06-01.yang
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -o root -g root ${S}/modules/ie=
tf-netconf.yang ${D}/etc/sysrepo/yang/ietf-netconf@2011-06-01.yang
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/etc/init.d
>> -=C2=A0=C2=A0=C2=A0 install -m 0775 ${WORKDIR}/sysrepo ${D}/etc/init.d=
/
>> -=C2=A0=C2=A0=C2=A0 install -d ${D}/usr/lib/sysrepo/plugins
>> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvin=
it', 'true', 'false', d)}; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0775 ${WORKDIR}=
/sysrepo ${D}/etc/init.d/
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/usr/lib/sy=
srepo/plugins
>=20
> Using Yocto's Installation variables (just like you have it for systemd=
 below) is a good idea [1]
> Eg,
>=20
> =C2=A0* ${D}/etc/init.d/ should be ${D}${sysconfdir}/init.d
> =C2=A0* ${D}/usr/lib/sysrepo/plugins should be ${D}${libdir}/sysrepo/pl=
ugins
>=20

Thanks for reviewing the patch. I will rework and send a v2

>=20
> Reference
> ---------
> [1] http://www.embeddedlinux.org.cn/OEManual/directories_installation.h=
tml
>=20
>> +=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'system=
d', 'true', 'false', d)}; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${systemd_s=
ystem_unitdir}
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}=
/sysrepod.service ${D}${systemd_system_unitdir}
>> +=C2=A0=C2=A0=C2=A0 fi
>> =C2=A0 }
>>
>> base-commit: db4752d19a46406683f4a4adf8187de8075b70b6
>> --=C2=A0
>> 2.17.1
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#15148):https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-arago/message/15148__;!!G3vK!WteFVQcTWZuhDmKaUzOjc=
hX06LXVt5bLZibOfjHxJB6hb6iS8cqgjcWTUCC72HeA5RiRLZJ012AQbGldvKNki1dPVak8P4=
3vSawg$
>> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/104256565/7030289__;!!G3vK!WteFVQcTWZuhDmKaUzOjchX06LXVt5bLZibOfj=
HxJB6hb6iS8cqgjcWTUCC72HeA5RiRLZJ012AQbGldvKNki1dPVak8P27WlTjr$
>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-arago/unsub__;!!G3vK!WteFVQcTWZuhDmKaUzOjchX06LXVt5bLZibOfjHxJB6h=
b6iS8cqgjcWTUCC72HeA5RiRLZJ012AQbGldvKNki1dPVak8P5U1J_IW$=C2=A0 [c-shilwa=
nt@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--=20
Regards,
Ravi

