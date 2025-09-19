Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CA4CAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 19:06:50 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.4582.1758308807519630156
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 12:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=AHJ6u58G;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58JJ6kku298671
	for <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 14:06:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758308806;
	bh=gPCrRecy/89ks1tZhSArRgJUW24eVicDbTcQ4APPPqw=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=AHJ6u58G1mRPr5CT2GvSKSREZmI/kMOL03FTW+4AL0eX0iXcmSF9XEQoWAeNwN4B6
	 XUjkhcNCqXBdYAzhX9vSLR2DBXxvb4DLae8Em82kpdpyrsHbm0y2hRXb1/tWRo9uLJ
	 d9aTtdV97NcMNNm6B2NzXkjN6sniplEEBL5z0rAg=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58JJ6khS3374128
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 14:06:46 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 19
 Sep 2025 14:06:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Sep 2025 14:06:46 -0500
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58JJ6km32774548;
	Fri, 19 Sep 2025 14:06:46 -0500
Message-ID: <a4c9c49c-066a-4665-8af4-f2be0062a8c3@ti.com>
Date: Fri, 19 Sep 2025 14:06:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH v1 1/2] libsdl2: Add tests package
To: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20250917220826.2078836-1-a-christidis@ti.com>
 <20250917220826.2078836-2-a-christidis@ti.com>
 <93d5f953-8d52-4f76-aa16-9deb4fee60ff@ti.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <93d5f953-8d52-4f76-aa16-9deb4fee60ff@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 58JJ6kku298671
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 19:06:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16600

Dear Ryan,


Thank you for the help and guidance for the fix ! Gonna send a v2 fixing=20
the native-sdk issue.

${libexecdir} is needed tho, otherwise the test binaries will be=20
packaged within the "libsdl2" package and not "libsdl2-tests" package.


Kind Regards,
Antonios

On 9/18/25 8:51 AM, Ryan Eatmon wrote:
>
>
> On 9/17/2025 5:08 PM, a-christidis@ti.com wrote:
>> From: Antonios Christidis <a-christidis@ti.com>
>>
>> The software provides tests, configure cmake to build and install them.
>> Package the tests in -tests package.
>>
>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> ---
>> =C2=A0 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc=C2=A0=C2=
=A0=C2=A0=C2=A0 | 5 +++++
>> =C2=A0 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend | 4=
 ++++
>> =C2=A0 2 files changed, 9 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>> =C2=A0 create mode 100644=20
>> meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
>>
>> diff --git a/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc=20
>> b/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>> new file mode 100644
>> index 00000000..12e06295
>> --- /dev/null
>> +++ b/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>> @@ -0,0 +1,5 @@
>> +EXTRA_OECMAKE:append =3D " -DSDL_TESTS=3DON \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 -DSDL_INSTALL_TESTS=3DON \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> +PACKAGE_BEFORE_PN =3D "${PN}-tests"
>> +FILES:${PN}-tests +=3D "${libexecdir} /usr/share/installed-tests/SDL2=
"
>
>
> I'm getting QA errors related to nativesdk-libsdl2.=C2=A0 I had to chan=
ge=20
> the above line to this:
>
> FILES:${PN}-tests:append =3D " ${datadir}/installed-tests/SDL2"
> FILES:${PN}-tests:append:class-nativesdk =3D "=20
> ${datadir}/installed-tests/SDL2"
>
> The libexecdir was not needed, and I changed the /usr/share to use the=20
> correct variable (datadir) in case someone wants to change the=20
> directory names in the Yocto manner.=C2=A0 I moved to append just so th=
at=20
> the two lines looked the same.
>
> I know this is also being submitted upstream, so these changes might=20
> be needed for those patches as well.
>
>
>> diff --git=20
>> a/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend=20
>> b/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
>> new file mode 100644
>> index 00000000..385aa801
>> --- /dev/null
>> +++ b/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
>> @@ -0,0 +1,4 @@
>> +LIBSDL2_TI =3D ""
>> +LIBSDL2_TI:ti-soc =3D "libsdl2-ti.inc"
>> +
>> +require ${LIBSDL2_TI}
>

