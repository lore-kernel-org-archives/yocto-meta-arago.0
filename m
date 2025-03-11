Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77273C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 19:11:53 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.18762.1741720304381596369
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 12:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nCXfArhT;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52BJBhhS847086
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 14:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741720303;
	bh=y9yQAzFB7+692rsX+UIaXDaYXuBwnz/BieSjE17ej2A=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=nCXfArhTV5jcxp7N9lLXaKKUPJRTEyTujahjjhu6LXQyT8bOB1rSj9XXfzJ7OPSjR
	 XI+IocmN8oOADLFWn8eUjL2dEk67caHIzfAa2aT1ck1Y77bLPplcdgqxFBZzBBtKEQ
	 nF3QNgPpHd3ydwPjXvaLyzn+Y8L/7GtuMgS+PqZg=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52BJBh6u079956
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Mar 2025 14:11:43 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 14:11:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 14:11:42 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BJBgiN001178;
	Tue, 11 Mar 2025 14:11:42 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 11 Mar 2025 14:11:42 -0500
Message-ID: <D8DOBH1Z0W3X.37ICDKG8VDW9H@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap/master][PATCH]
 packagegroup-arago-tisdk-gtk: set PACKAGE_ARCH
From: Randolph Sapp <rs@ti.com>
To: Andrew Davis <afd@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250311003556.3131699-2-rs@ti.com>
 <5be8e47e-5753-4893-b22f-371524842c47@ti.com>
In-Reply-To: <5be8e47e-5753-4893-b22f-371524842c47@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 19:11:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15978

On Tue Mar 11, 2025 at 8:22 AM CDT, Andrew Davis wrote:
> On 3/10/25 7:35 PM, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>=20
>> This packagegroup pulls a package that is automatically renamed with
>> DEBIAN_NAMES. This is not allowed due to a sanity check that was added
>> to prevent issues with packagegroups being aggressively cached and
>> DEBIAN_NAMES potentially breaking this cache. See [YOCTO #7298] or
>> 5bf3e447d2f in openembedded-core [1].
>>=20
>> [1] https://git.openembedded.org/openembedded-core/commit/?id=3D5bf3e447=
d2f5064495d83a8fad30229bcf1ecc9b
>>=20
>> Fixes: 731fd376 (packagegroups: Do not set package arch when unneeded, 2=
025-03-03)
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>=20
>
> Should we just drop this package group? Only has 2 packages, one is just =
a demo,
> and the other (gtk+3) should be installed by DEPENDS only for packages th=
at depend
> on it, not unconditionally as done here.
>
> Andrew

Well, we could drop the gtk+3 package from the group and keep the demos so =
we
know gtk+3 is still implicitly pulled. Gets weird considering this layer at=
 one
point came with default applications and libraries we thought were useful.

I don't know. Ryan, Denys, do you guys think we've weaned enough customers =
off
of using the example SDK directly to move to a more pragmatic packaging lis=
t?
(Just the stuff required to test things and maybe some debug tools.)

>> Tagged scarthgap/master as the origional patch was, but I don't think th=
e
>> original patch has made it to master yet.
>>=20
>>   .../packagegroups/packagegroup-arago-tisdk-gtk.bb             | 4 ++++
>>   1 file changed, 4 insertions(+)
>>=20
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-tisdk-gtk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegro=
up-arago-tisdk-gtk.bb
>> index cd6dd895..e0a90a31 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-gtk.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-gtk.bb
>> @@ -2,6 +2,10 @@ DESCRIPTION =3D "Task to add Gtk embedded related packa=
ges"
>>   LICENSE =3D "MIT"
>>   PR =3D "r2"
>>  =20
>> +# Required for packages that are renamed using DEBIAN_NAMES
>> +# [YOCTO #7298]
>> +PACKAGE_ARCH =3D "${TUNE_PKGARCH}"
>> +
>>   inherit packagegroup
>>  =20
>>   RDEPENDS:${PN} =3D "\


