Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DACEB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 14:30:37 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.15036.1687876235359196147
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 07:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=xnrqz1VH;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35REUWMt010235;
	Tue, 27 Jun 2023 09:30:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687876232;
	bh=SNTTON3hLQGA2O70/caJD7WJqFendIe+zqS+CQCOgEw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xnrqz1VHLpgUwCdfiZxt/KJulbPo/FNSM9D5Gm7FclnM2zDDk39qCUc/z+ArFs4I3
	 WJCH1jZqkzPpC9nF2abiQy8oQD59GPI+rNP+yX07WBnvVfChmVI3sd/QQ2CizLlOMF
	 vd/eif/h5d8YbSCRhfgE7JgHHX6WIdCtXBd89QNo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35REUWnr028194
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jun 2023 09:30:32 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 09:30:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 09:30:32 -0500
Received: from [10.249.130.150] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35REUT1w101048;
	Tue, 27 Jun 2023 09:30:30 -0500
Message-ID: <01f530b5-50f2-e755-c976-60571c92d852@ti.com>
Date: Tue, 27 Jun 2023 20:00:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [master/kirkstone][PATCH v3 8/8] tisdk-default-image: Add package
 group for netopeer/sysrepo
To: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <g-gupta@ti.com>, <praneeth@ti.com>
References: <20230627100345.24340-1-r-gunasekaran@ti.com>
 <20230627100345.24340-9-r-gunasekaran@ti.com>
 <a6e8706a-77d6-77d1-1aea-dac62789bcbc@ti.com>
Content-Language: en-US
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <a6e8706a-77d6-77d1-1aea-dac62789bcbc@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 35REUWMt010235
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Jun 2023 14:30:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14705



On 6/27/2023 7:39 PM, Ryan Eatmon wrote:
>
>
> On 6/27/2023 5:03 AM, Ravi Gunasekaran wrote:
>> Add new package group for netopeer2, sysrepo, nw-configurator
>> and yang models.
>>
>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>> ---
>>
>> Changes since v2:
>> ----------------
>> Removed "PACKAGE_ARCH" as this is not machine specific.
>>
>> Changes since v1:
>> ----------------
>> Added a new package group packagegroup-arago-tisdk-sysrepo instead of
>> using ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL.
>>
>> =C2=A0 .../recipes-core/images/tisdk-default-image.bb=C2=A0=C2=A0=C2=A0=
 |=C2=A0 1 +
>> =C2=A0 .../packagegroup-arago-tisdk-sysrepo.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15 +++++++++++++++
>> =C2=A0 2 files changed, 16 insertions(+)
>> =C2=A0 create mode 100644
>> meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-=
sysrepo.bb
>>
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image=
.bb
>> b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> index bb825e09..7769c97c 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> PACKAGE_ARCH+++ b/meta-arago-distro/recipes-core/images/tisdk-default-=
image.bb
>
> Something is wrong with this patch... It does apply at all. I think it =
is the
> PACKAGE_ARCH that appears on the above line.=C2=A0 Not sure where that =
came from,
> but git/patch does not like it.

Yes, you are right. Seems like it got added while I was updating the chan=
ge
history.
I will send out a v4.

>
>
>> @@ -28,6 +28,7 @@ IMAGE_INSTALL +=3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti-analytics \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti-demos \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
>> +=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-sysrepo \
>> =C2=A0 "
>> =C2=A0 =C2=A0 export IMAGE_BASENAME =3D "tisdk-default-image"
>> diff --git
>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd=
k-sysrepo.bb
>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd=
k-sysrepo.bb
>>
>> new file mode 100644
>> index 00000000..c0bb599b
>> --- /dev/null
>> +++
>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd=
k-sysrepo.bb
>> @@ -0,0 +1,15 @@
>> +SUMMARY =3D "Netopeer2 and Sysrepo packagegroup"
>> +LICENSE =3D "MIT"
>> +
>> +inherit packagegroup
>> +
>> +ARAGO_NETOPEER_SYSREPO =3D "\
>> +=C2=A0=C2=A0=C2=A0 sysrepo \
>> +=C2=A0=C2=A0=C2=A0 netopeer2-server \
>> +=C2=A0=C2=A0=C2=A0 nw-configurator \
>> +=C2=A0=C2=A0=C2=A0 tsn-yang-models \
>> +"
>> +
>> +RDEPENDS:${PN} =3D "\
>> +=C2=A0=C2=A0=C2=A0 ${ARAGO_NETOPEER_SYSREPO} \
>> +"
>


