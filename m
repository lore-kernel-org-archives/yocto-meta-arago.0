Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03242C43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 14:33:47 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.5632.1655303620115633000
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 15 Jun 2022 07:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=Fue9xA9d;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25FEXZh5085376;
	Wed, 15 Jun 2022 09:33:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655303615;
	bh=MGNbrUVC9XDlokCzmGEFEgTvZsr68SD7R22X3r4l2NI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Fue9xA9dOpprrxlqLxXLhh4Itzl/Wd/e4lritkclUVI5vpsTkzNOkcm/TJTze/xkw
	 7SYMQ9mU2ScH2FHIdSpl+JYe6WBE2eogOFps+1T0NiW1l+LIlWUHQeU6F4oaaSZpZp
	 uVGmyvC+nJ+pysLCinWCPkvs3/Jw5/vD3ymWEID0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25FEXZ61059931
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Jun 2022 09:33:35 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 15
 Jun 2022 09:33:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 15 Jun 2022 09:33:34 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25FEXYYH015523;
	Wed, 15 Jun 2022 09:33:34 -0500
Message-ID: <ab290056-0737-1c0d-9a4c-375a8231ee61@ti.com>
Date: Wed, 15 Jun 2022 09:33:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [meta-arago] [meta-ti][dunfell][PATCH v4 2/2] optee: Upgrade to
 upstream 3.17.0
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220614215515.30820-1-afd@ti.com>
 <20220614215515.30820-2-afd@ti.com> <20220614231422.GS9834@denix.org>
 <2f8a8c44-7dd9-6a8a-1411-950cea63cc8a@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <2f8a8c44-7dd9-6a8a-1411-950cea63cc8a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id
 25FEXZh5085376
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 15 Jun 2022 14:33:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13903


We still do need a patch for meta-arago to remove the optee stuff that=20
you are moving to meta-ti...


On 6/14/2022 22:48, Andrew Davis wrote:
> On 6/14/22 6:14 PM, Denys Dmytriyenko wrote:
>> Wrong list?
>>
>=20
> Oops, looks like it, re-sending over to meta-ti..
>=20
>>
>> On Tue, Jun 14, 2022 at 04:55:15PM -0500, Andrew Davis via=20
>> lists.yoctoproject.org wrote:
>>> Update to the latest upstream master which is 3.17.
>>> We do this to add HUK and AM64x/AM62x support.
>>> With this we need to also switch OPTEEMACHINE for AM64x/AM62x.
>>>
>>> To build against the latest OP-TEE the support recipes need updated=20
>>> also.
>>> Move these here into meta-ti so that builds will still work when not=20
>>> using
>>> meta-arago-distro.
>>>
>>> The fix patches do not look to be needed anymore.
>>>
>>> While here switch to git checkout with https.
>>>
>>> NOTE: The latest OP-TEE requires SYSFW 8.04+
>>>
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>>
>>> Changes from v3:
>>> =C2=A0 - Added note about SYSFW version req
>>> =C2=A0 - Updated optee-os SRCREV to newer commit
>>>
>>> Changes from v2:
>>> =C2=A0 - Switch OPTEEMACHINE
>>> =C2=A0 - Update optee-examples
>>>
>>> =C2=A0 conf/machine/include/am62xx.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>>> =C2=A0 conf/machine/include/am64xx.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>>> =C2=A0 .../optee/optee-client_%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
>>> =C2=A0 .../optee/optee-examples_%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
>>> =C2=A0 ...ow-setting-sysroot-for-libgcc-lookup.patch | 34 -----------=
--------
>>> =C2=A0 ...0007-allow-setting-sysroot-for-clang.patch | 29 -----------=
-----
>>> =C2=A0 recipes-security/optee/optee-os_%.bbappend=C2=A0=C2=A0=C2=A0 |=
 14 +++-----
>>> =C2=A0 recipes-security/optee/optee-test_%.bbappend=C2=A0 |=C2=A0 5 +=
++
>>> =C2=A0 8 files changed, 15 insertions(+), 75 deletions(-)
>>> =C2=A0 create mode 100644 recipes-security/optee/optee-client_%.bbapp=
end
>>> =C2=A0 create mode 100644 recipes-security/optee/optee-examples_%.bba=
ppend
>>> =C2=A0 delete mode 100644=20
>>> recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc=
-lookup.patch=20
>>>
>>> =C2=A0 delete mode 100644=20
>>> recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.=
patch=20
>>>
>>> =C2=A0 create mode 100644 recipes-security/optee/optee-test_%.bbappen=
d
>>>
>>> diff --git a/conf/machine/include/am62xx.inc=20
>>> b/conf/machine/include/am62xx.inc
>>> index ff857b97..0364edd1 100644
>>> --- a/conf/machine/include/am62xx.inc
>>> +++ b/conf/machine/include/am62xx.inc
>>> @@ -15,5 +15,5 @@ do_image_wic[mcdepends] =3D=20
>>> "mc::k3r5:ti-sci-fw:do_deploy"
>>> =C2=A0 do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
>>> =C2=A0 TFA_BOARD =3D "lite"
>>> -OPTEEMACHINE =3D "k3-am65x"
>>> +OPTEEMACHINE =3D "k3-am62x"
>>> =C2=A0 OPTEEOUTPUTMACHINE =3D "k3"
>>> diff --git a/conf/machine/include/am64xx.inc=20
>>> b/conf/machine/include/am64xx.inc
>>> index 7646c70a..60ffacd5 100644
>>> --- a/conf/machine/include/am64xx.inc
>>> +++ b/conf/machine/include/am64xx.inc
>>> @@ -20,7 +20,7 @@ do_image_wic[mcdepends] =3D=20
>>> "mc::k3r5:ti-sci-fw:do_deploy"
>>> =C2=A0 do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
>>> =C2=A0 TFA_BOARD =3D "lite"
>>> -OPTEEMACHINE =3D "k3-am65x"
>>> +OPTEEMACHINE =3D "k3-am64x"
>>> =C2=A0 OPTEEOUTPUTMACHINE =3D "k3"
>>> =C2=A0 # Set the list of device targets for ti-pdk class recipes
>>> diff --git a/recipes-security/optee/optee-client_%.bbappend=20
>>> b/recipes-security/optee/optee-client_%.bbappend
>>> new file mode 100644
>>> index 00000000..5675570a
>>> --- /dev/null
>>> +++ b/recipes-security/optee/optee-client_%.bbappend
>>> @@ -0,0 +1,2 @@
>>> +PV_ti-soc =3D "3.17.0+git${SRCPV}"
>>> +SRCREV_ti-soc =3D "a5c30b1277466a9bf85b62f45a6b00e79774e29c"
>>> diff --git a/recipes-security/optee/optee-examples_%.bbappend=20
>>> b/recipes-security/optee/optee-examples_%.bbappend
>>> new file mode 100644
>>> index 00000000..19e32d9d
>>> --- /dev/null
>>> +++ b/recipes-security/optee/optee-examples_%.bbappend
>>> @@ -0,0 +1,2 @@
>>> +PV_ti-soc =3D "3.17.0+git${SRCPV}"
>>> +SRCREV_ti-soc =3D "65fc74309e12189ad5b6ce3ffec37c8011088a5a"
>>> diff --git=20
>>> a/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libg=
cc-lookup.patch=20
>>> b/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libg=
cc-lookup.patch=20
>>>
>>> deleted file mode 100644
>>> index 17005396..00000000
>>> ---=20
>>> a/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libg=
cc-lookup.patch=20
>>>
>>> +++ /dev/null
>>> @@ -1,34 +0,0 @@
>>> -From 0bab935695ebcf0c533b49896ab18ff33d4a47d1 Mon Sep 17 00:00:00 20=
01
>>> -From: Ross Burton <ross.burton@arm.com>
>>> -Date: Tue, 26 May 2020 14:38:02 -0500
>>> -Subject: [PATCH] allow setting sysroot for libgcc lookup
>>> -
>>> -Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when=20
>>> searching
>>> -for the compiler libraries as there's no easy way to reliably pass=20
>>> --sysroot
>>> -otherwise.
>>> -
>>> -Upstream-Status: Pending=20
>>> [https://github.com/OP-TEE/optee_os/issues/4188]
>>> -Signed-off-by: Ross Burton <ross.burton@arm.com>
>>> ----
>>> - mk/gcc.mk | 6 +++---
>>> - 1 file changed, 3 insertions(+), 3 deletions(-)
>>> -
>>> -diff --git a/mk/gcc.mk b/mk/gcc.mk
>>> -index adc77a24..81bfa78a 100644
>>> ---- a/mk/gcc.mk
>>> -+++ b/mk/gcc.mk
>>> -@@ -13,11 +13,11 @@ nostdinc$(sm)=C2=A0=C2=A0=C2=A0 :=3D -nostdinc -=
isystem $(shell=20
>>> $(CC$(sm)) \
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -print-file-name=3Dinclude 2> /dev/null)
>>> -
>>> - # Get location of libgcc from gcc
>>> --libgcc$(sm)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=3D $(shell $(CC$(sm)) $=
(CFLAGS$(arch-bits-$(sm))) \
>>> -+libgcc$(sm)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=3D $(shell $(CC$(sm)) $=
(LIBGCC_LOCATE_CFLAGS)=20
>>> $(CFLAGS$(arch-bits-$(sm))) \
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -print-libgcc-file-name 2> /dev/null)
>>> --libstdc++$(sm)=C2=A0=C2=A0=C2=A0 :=3D $(shell $(CXX$(sm))=20
>>> $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
>>> -+libstdc++$(sm)=C2=A0=C2=A0=C2=A0 :=3D $(shell $(CXX$(sm)) $(LIBGCC_=
LOCATE_CFLAGS)=20
>>> $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -print-file-name=3Dlibstdc++.a 2> /dev/null)
>>> --libgcc_eh$(sm)=C2=A0=C2=A0=C2=A0 :=3D $(shell $(CXX$(sm))=20
>>> $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
>>> -+libgcc_eh$(sm)=C2=A0=C2=A0=C2=A0 :=3D $(shell $(CXX$(sm)) $(LIBGCC_=
LOCATE_CFLAGS)=20
>>> $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -print-file-name=3Dlibgcc_eh.a 2> /dev/null)
>>> -
>>> - # Define these to something to discover accidental use
>>> diff --git=20
>>> a/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clan=
g.patch=20
>>> b/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clan=
g.patch=20
>>>
>>> deleted file mode 100644
>>> index 5c0d0a56..00000000
>>> ---=20
>>> a/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clan=
g.patch=20
>>>
>>> +++ /dev/null
>>> @@ -1,29 +0,0 @@
>>> -From 3167f2c0dba4db59d61b60a8fe66f969d20aafa9 Mon Sep 17 00:00:00 20=
01
>>> -From: Brett Warren <brett.warren@arm.com>
>>> -Date: Wed, 23 Sep 2020 09:27:34 +0100
>>> -Subject: [PATCH] optee: enable clang support
>>> -
>>> -When compiling with clang, the LIBGCC_LOCATE_CFLAG variable used
>>> -to provide a sysroot wasn't included, which results in not locating
>>> -compiler-rt. This is mitigated by including the variable as ammended.
>>> -
>>> -Upstream-Status: Pending
>>> -ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
>>> -Signed-off-by: Brett Warren <brett.warren@arm.com>
>>> ----
>>> - mk/clang.mk | 2 +-
>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>> -
>>> -diff --git a/mk/clang.mk b/mk/clang.mk
>>> -index 0f48c836..47465523 100644
>>> ---- a/mk/clang.mk
>>> -+++ b/mk/clang.mk
>>> -@@ -27,7 +27,7 @@ comp-cflags-warns-clang :=3D=20
>>> -Wno-language-extension-token \
>>> -
>>> - # Note, use the compiler runtime library (libclang_rt.builtins.*.a)=
=20
>>> instead of
>>> - # libgcc for clang
>>> --libgcc$(sm)=C2=A0=C2=A0=C2=A0 :=3D $(shell $(CC$(sm)) $(CFLAGS$(arc=
h-bits-$(sm))) \
>>> -+libgcc$(sm)=C2=A0=C2=A0=C2=A0 :=3D $(shell $(CC$(sm)) $(LIBGCC_LOCA=
TE_CFLAGS)=20
>>> $(CFLAGS$(arch-bits-$(sm))) \
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -rtlib=3Dcompiler-rt -print-libgcc-file-name 2> /dev/null)
>>> -
>>> - # Core ASLR relies on the executable being ready to run from its=20
>>> preferred load
>>> diff --git a/recipes-security/optee/optee-os_%.bbappend=20
>>> b/recipes-security/optee/optee-os_%.bbappend
>>> index 4e01ea74..75bd28ea 100644
>>> --- a/recipes-security/optee/optee-os_%.bbappend
>>> +++ b/recipes-security/optee/optee-os_%.bbappend
>>> @@ -1,14 +1,8 @@
>>> -FILESEXTRAPATHS_prepend_ti-soc :=3D "${THISDIR}/${PN}:"
>>> +PV_ti-soc =3D "3.17.0+git${SRCPV}"
>>> +SRCREV_ti-soc =3D "bf9dfcc22a3c26edaba666d63cfaec0c3d1c5655"
>>> +SRC_URI_ti-soc =3D "git://github.com/OP-TEE/optee_os.git;protocol=3D=
https"
>>> -PV_ti-soc =3D "3.12.0+git${SRCPV}"
>>> -
>>> -SRCREV_ti-soc =3D "3d47a131bca1d9ed511bfd516aa5e70269e12c1d"
>>> -
>>> -SRC_URI_ti-soc =3D " \
>>> -=C2=A0=C2=A0=C2=A0 git://github.com/OP-TEE/optee_os.git \
>>> -=C2=A0=C2=A0=C2=A0 file://0006-allow-setting-sysroot-for-libgcc-look=
up.patch \
>>> -=C2=A0=C2=A0=C2=A0 file://0007-allow-setting-sysroot-for-clang.patch=
 \
>>> -"
>>> +DEPENDS_append_ti-soc =3D " python3-cryptography-native"
>>> =C2=A0 EXTRA_OEMAKE_append_k3 =3D "${@ 'CFG_CONSOLE_UART=3D'+=20
>>> d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>>> diff --git a/recipes-security/optee/optee-test_%.bbappend=20
>>> b/recipes-security/optee/optee-test_%.bbappend
>>> new file mode 100644
>>> index 00000000..d81ae521
>>> --- /dev/null
>>> +++ b/recipes-security/optee/optee-test_%.bbappend
>>> @@ -0,0 +1,5 @@
>>> +PV_ti-soc =3D "3.17.0+git${SRCPV}"
>>> +SRCREV_ti-soc =3D "8a698baf9e8e010e4d8d52e6aded42dfc31e5b25"
>>> +SRC_URI_ti-soc =3D=20
>>> "git://github.com/OP-TEE/optee_test.git;protocol=3Dhttps"
>>> +
>>> +DEPENDS_append_ti-soc =3D " python3-cryptography-native"
>>> --=20
>>> 2.36.1

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

