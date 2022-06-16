Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8450FC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 19:30:45 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.21930.1655407837398455333
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 16 Jun 2022 12:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=nmqocz94;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25GJUaem060630;
	Thu, 16 Jun 2022 14:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655407836;
	bh=xzdyfDQ9A22ICs3DuHKecblISvZfj/P+h4UMFYHfRcw=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=nmqocz9429HygWq3nmRthLwreC6MBawNKJ1Ufwf0bPeIE9VHCINyFA6CPKZXZjpJ0
	 kXUeXKRVVScQfyXl7kSP2PG8Yw2QAw7rqBW9w8vHnLCzehj2j70xxIMT3ePVWw4YrN
	 3rQzrotlTMDXqh1J0xHRLNE9WCEHzgtiqKfQR1TA=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25GJUabO015186
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jun 2022 14:30:36 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 16
 Jun 2022 14:30:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 16 Jun 2022 14:30:35 -0500
Received: from [10.250.33.138] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25GJUZ0G079928;
	Thu, 16 Jun 2022 14:30:35 -0500
Message-ID: <58d6b756-1a89-b028-7bbb-7bd4d4bdc821@ti.com>
Date: Thu, 16 Jun 2022 14:30:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [meta-ti][dunfell][PATCH v4 2/2] optee: Upgrade to upstream
 3.17.0
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220614215515.30820-1-afd@ti.com>
 <20220614215515.30820-2-afd@ti.com>
 <c3f24e95-1b6b-b052-fe1d-9e0350a71532@ti.com>
 <3a5cb011-fe91-651c-ebd9-a394af4bed8a@ti.com>
 <d25bb96e-3912-e022-3613-7fcd904b4c3c@ti.com>
 <a4a0c9ed-e4c2-7878-170f-c586483bf558@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <a4a0c9ed-e4c2-7878-170f-c586483bf558@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id
 25GJUaem060630
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 16 Jun 2022 19:30:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13911

Testing looks good now, v5 sent.

Andrew

On 6/16/22 1:39 PM, Ryan Eatmon wrote:
>=20
> I was seeing build errors, but they turned out not to be related to you=
r change.=C2=A0 It was something else (I just found out).=C2=A0 I'm ok to=
 merge your changes back in when your testing is good.
>=20
>=20
> On 6/16/2022 11:32, Andrew Davis wrote:
>> Build errors or test errors? I'm ready to push v5 but
>> don't see any build errors with v4.
>>
>> Andrew
>>
>> On 6/15/22 5:40 PM, Ryan Eatmon wrote:
>>>
>>> My initial test builds showed a number of errors so I already backed =
it out.
>>>
>>>
>>> On 6/15/2022 16:32, Andrew Davis wrote:
>>>> Lets hold off on this patch for one more day, might be a bug in
>>>> the latest OP-TEE that might impact AM64x/AM62x GP boards..
>>>> need to do one more round of sanity checks here, and change the
>>>> commit we move to if we are affected.
>>>>
>>>> Andrew
>>>>
>>>> On 6/14/22 4:55 PM, Andrew Davis wrote:
>>>>> Update to the latest upstream master which is 3.17.
>>>>> We do this to add HUK and AM64x/AM62x support.
>>>>> With this we need to also switch OPTEEMACHINE for AM64x/AM62x.
>>>>>
>>>>> To build against the latest OP-TEE the support recipes need updated=
 also.
>>>>> Move these here into meta-ti so that builds will still work when no=
t using
>>>>> meta-arago-distro.
>>>>>
>>>>> The fix patches do not look to be needed anymore.
>>>>>
>>>>> While here switch to git checkout with https.
>>>>>
>>>>> NOTE: The latest OP-TEE requires SYSFW 8.04+
>>>>>
>>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>>> ---
>>>>>
>>>>> Changes from v3:
>>>>> =C2=A0 - Added note about SYSFW version req
>>>>> =C2=A0 - Updated optee-os SRCREV to newer commit
>>>>>
>>>>> Changes from v2:
>>>>> =C2=A0 - Switch OPTEEMACHINE
>>>>> =C2=A0 - Update optee-examples
>>>>>
>>>>> =C2=A0 conf/machine/include/am62xx.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>>>>> =C2=A0 conf/machine/include/am64xx.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>>>>> =C2=A0 .../optee/optee-client_%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
>>>>> =C2=A0 .../optee/optee-examples_%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
>>>>> =C2=A0 ...ow-setting-sysroot-for-libgcc-lookup.patch | 34 ---------=
----------
>>>>> =C2=A0 ...0007-allow-setting-sysroot-for-clang.patch | 29 ---------=
-------
>>>>> =C2=A0 recipes-security/optee/optee-os_%.bbappend=C2=A0=C2=A0=C2=A0=
 | 14 +++-----
>>>>> =C2=A0 recipes-security/optee/optee-test_%.bbappend=C2=A0 |=C2=A0 5=
 +++
>>>>> =C2=A0 8 files changed, 15 insertions(+), 75 deletions(-)
>>>>> =C2=A0 create mode 100644 recipes-security/optee/optee-client_%.bba=
ppend
>>>>> =C2=A0 create mode 100644 recipes-security/optee/optee-examples_%.b=
bappend
>>>>> =C2=A0 delete mode 100644 recipes-security/optee/optee-os/0006-allo=
w-setting-sysroot-for-libgcc-lookup.patch
>>>>> =C2=A0 delete mode 100644 recipes-security/optee/optee-os/0007-allo=
w-setting-sysroot-for-clang.patch
>>>>> =C2=A0 create mode 100644 recipes-security/optee/optee-test_%.bbapp=
end
>>>>>
>>>>> diff --git a/conf/machine/include/am62xx.inc b/conf/machine/include=
/am62xx.inc
>>>>> index ff857b97..0364edd1 100644
>>>>> --- a/conf/machine/include/am62xx.inc
>>>>> +++ b/conf/machine/include/am62xx.inc
>>>>> @@ -15,5 +15,5 @@ do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:d=
o_deploy"
>>>>> =C2=A0 do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
>>>>> =C2=A0 TFA_BOARD =3D "lite"
>>>>> -OPTEEMACHINE =3D "k3-am65x"
>>>>> +OPTEEMACHINE =3D "k3-am62x"
>>>>> =C2=A0 OPTEEOUTPUTMACHINE =3D "k3"
>>>>> diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include=
/am64xx.inc
>>>>> index 7646c70a..60ffacd5 100644
>>>>> --- a/conf/machine/include/am64xx.inc
>>>>> +++ b/conf/machine/include/am64xx.inc
>>>>> @@ -20,7 +20,7 @@ do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:d=
o_deploy"
>>>>> =C2=A0 do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
>>>>> =C2=A0 TFA_BOARD =3D "lite"
>>>>> -OPTEEMACHINE =3D "k3-am65x"
>>>>> +OPTEEMACHINE =3D "k3-am64x"
>>>>> =C2=A0 OPTEEOUTPUTMACHINE =3D "k3"
>>>>> =C2=A0 # Set the list of device targets for ti-pdk class recipes
>>>>> diff --git a/recipes-security/optee/optee-client_%.bbappend b/recip=
es-security/optee/optee-client_%.bbappend
>>>>> new file mode 100644
>>>>> index 00000000..5675570a
>>>>> --- /dev/null
>>>>> +++ b/recipes-security/optee/optee-client_%.bbappend
>>>>> @@ -0,0 +1,2 @@
>>>>> +PV_ti-soc =3D "3.17.0+git${SRCPV}"
>>>>> +SRCREV_ti-soc =3D "a5c30b1277466a9bf85b62f45a6b00e79774e29c"
>>>>> diff --git a/recipes-security/optee/optee-examples_%.bbappend b/rec=
ipes-security/optee/optee-examples_%.bbappend
>>>>> new file mode 100644
>>>>> index 00000000..19e32d9d
>>>>> --- /dev/null
>>>>> +++ b/recipes-security/optee/optee-examples_%.bbappend
>>>>> @@ -0,0 +1,2 @@
>>>>> +PV_ti-soc =3D "3.17.0+git${SRCPV}"
>>>>> +SRCREV_ti-soc =3D "65fc74309e12189ad5b6ce3ffec37c8011088a5a"
>>>>> diff --git a/recipes-security/optee/optee-os/0006-allow-setting-sys=
root-for-libgcc-lookup.patch b/recipes-security/optee/optee-os/0006-allow=
-setting-sysroot-for-libgcc-lookup.patch
>>>>> deleted file mode 100644
>>>>> index 17005396..00000000
>>>>> --- a/recipes-security/optee/optee-os/0006-allow-setting-sysroot-fo=
r-libgcc-lookup.patch
>>>>> +++ /dev/null
>>>>> @@ -1,34 +0,0 @@
>>>>> -From 0bab935695ebcf0c533b49896ab18ff33d4a47d1 Mon Sep 17 00:00:00 =
2001
>>>>> -From: Ross Burton <ross.burton@arm.com>
>>>>> -Date: Tue, 26 May 2020 14:38:02 -0500
>>>>> -Subject: [PATCH] allow setting sysroot for libgcc lookup
>>>>> -
>>>>> -Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable whe=
n searching
>>>>> -for the compiler libraries as there's no easy way to reliably pass=
 --sysroot
>>>>> -otherwise.
>>>>> -
>>>>> -Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issue=
s/4188]
>>>>> -Signed-off-by: Ross Burton <ross.burton@arm.com>
>>>>> ----
>>>>> - mk/gcc.mk | 6 +++---
>>>>> - 1 file changed, 3 insertions(+), 3 deletions(-)
>>>>> -
>>>>> -diff --git a/mk/gcc.mk b/mk/gcc.mk
>>>>> -index adc77a24..81bfa78a 100644
>>>>> ---- a/mk/gcc.mk
>>>>> -+++ b/mk/gcc.mk
>>>>> -@@ -13,11 +13,11 @@ nostdinc$(sm)=C2=A0=C2=A0=C2=A0 :=3D -nostdinc=
 -isystem $(shell $(CC$(sm)) \
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -print-file-name=3Dinclude 2> /dev/null)
>>>>> -
>>>>> - # Get location of libgcc from gcc
>>>>> --libgcc$(sm)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=3D $(shell $(CC$(sm))=
 $(CFLAGS$(arch-bits-$(sm))) \
>>>>> -+libgcc$(sm)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=3D $(shell $(CC$(sm))=
 $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -print-libgcc-file-name 2> /dev/null)
>>>>> --libstdc++$(sm)=C2=A0=C2=A0=C2=A0 :=3D $(shell $(CXX$(sm)) $(CXXFL=
AGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
>>>>> -+libstdc++$(sm)=C2=A0=C2=A0=C2=A0 :=3D $(shell $(CXX$(sm)) $(LIBGC=
C_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -print-file-name=3Dlibstdc++.a 2> /dev/null)
>>>>> --libgcc_eh$(sm)=C2=A0=C2=A0=C2=A0 :=3D $(shell $(CXX$(sm)) $(CXXFL=
AGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
>>>>> -+libgcc_eh$(sm)=C2=A0=C2=A0=C2=A0 :=3D $(shell $(CXX$(sm)) $(LIBGC=
C_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -print-file-name=3Dlibgcc_eh.a 2> /dev/null)
>>>>> -
>>>>> - # Define these to something to discover accidental use
>>>>> diff --git a/recipes-security/optee/optee-os/0007-allow-setting-sys=
root-for-clang.patch b/recipes-security/optee/optee-os/0007-allow-setting=
-sysroot-for-clang.patch
>>>>> deleted file mode 100644
>>>>> index 5c0d0a56..00000000
>>>>> --- a/recipes-security/optee/optee-os/0007-allow-setting-sysroot-fo=
r-clang.patch
>>>>> +++ /dev/null
>>>>> @@ -1,29 +0,0 @@
>>>>> -From 3167f2c0dba4db59d61b60a8fe66f969d20aafa9 Mon Sep 17 00:00:00 =
2001
>>>>> -From: Brett Warren <brett.warren@arm.com>
>>>>> -Date: Wed, 23 Sep 2020 09:27:34 +0100
>>>>> -Subject: [PATCH] optee: enable clang support
>>>>> -
>>>>> -When compiling with clang, the LIBGCC_LOCATE_CFLAG variable used
>>>>> -to provide a sysroot wasn't included, which results in not locatin=
g
>>>>> -compiler-rt. This is mitigated by including the variable as ammend=
ed.
>>>>> -
>>>>> -Upstream-Status: Pending
>>>>> -ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
>>>>> -Signed-off-by: Brett Warren <brett.warren@arm.com>
>>>>> ----
>>>>> - mk/clang.mk | 2 +-
>>>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>> -
>>>>> -diff --git a/mk/clang.mk b/mk/clang.mk
>>>>> -index 0f48c836..47465523 100644
>>>>> ---- a/mk/clang.mk
>>>>> -+++ b/mk/clang.mk
>>>>> -@@ -27,7 +27,7 @@ comp-cflags-warns-clang :=3D -Wno-language-exten=
sion-token \
>>>>> -
>>>>> - # Note, use the compiler runtime library (libclang_rt.builtins.*.=
a) instead of
>>>>> - # libgcc for clang
>>>>> --libgcc$(sm)=C2=A0=C2=A0=C2=A0 :=3D $(shell $(CC$(sm)) $(CFLAGS$(a=
rch-bits-$(sm))) \
>>>>> -+libgcc$(sm)=C2=A0=C2=A0=C2=A0 :=3D $(shell $(CC$(sm)) $(LIBGCC_LO=
CATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -rtlib=3Dcompiler-rt -print-libgcc-file-name 2> /dev/null)
>>>>> -
>>>>> - # Core ASLR relies on the executable being ready to run from its =
preferred load
>>>>> diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-s=
ecurity/optee/optee-os_%.bbappend
>>>>> index 4e01ea74..75bd28ea 100644
>>>>> --- a/recipes-security/optee/optee-os_%.bbappend
>>>>> +++ b/recipes-security/optee/optee-os_%.bbappend
>>>>> @@ -1,14 +1,8 @@
>>>>> -FILESEXTRAPATHS_prepend_ti-soc :=3D "${THISDIR}/${PN}:"
>>>>> +PV_ti-soc =3D "3.17.0+git${SRCPV}"
>>>>> +SRCREV_ti-soc =3D "bf9dfcc22a3c26edaba666d63cfaec0c3d1c5655"
>>>>> +SRC_URI_ti-soc =3D "git://github.com/OP-TEE/optee_os.git;protocol=3D=
https"
>>>>> -PV_ti-soc =3D "3.12.0+git${SRCPV}"
>>>>> -
>>>>> -SRCREV_ti-soc =3D "3d47a131bca1d9ed511bfd516aa5e70269e12c1d"
>>>>> -
>>>>> -SRC_URI_ti-soc =3D " \
>>>>> -=C2=A0=C2=A0=C2=A0 git://github.com/OP-TEE/optee_os.git \
>>>>> -=C2=A0=C2=A0=C2=A0 file://0006-allow-setting-sysroot-for-libgcc-lo=
okup.patch \
>>>>> -=C2=A0=C2=A0=C2=A0 file://0007-allow-setting-sysroot-for-clang.pat=
ch \
>>>>> -"
>>>>> +DEPENDS_append_ti-soc =3D " python3-cryptography-native"
>>>>> =C2=A0 EXTRA_OEMAKE_append_k3 =3D "${@ 'CFG_CONSOLE_UART=3D'+ d.get=
Var('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>>>>> diff --git a/recipes-security/optee/optee-test_%.bbappend b/recipes=
-security/optee/optee-test_%.bbappend
>>>>> new file mode 100644
>>>>> index 00000000..d81ae521
>>>>> --- /dev/null
>>>>> +++ b/recipes-security/optee/optee-test_%.bbappend
>>>>> @@ -0,0 +1,5 @@
>>>>> +PV_ti-soc =3D "3.17.0+git${SRCPV}"
>>>>> +SRCREV_ti-soc =3D "8a698baf9e8e010e4d8d52e6aded42dfc31e5b25"
>>>>> +SRC_URI_ti-soc =3D "git://github.com/OP-TEE/optee_test.git;protoco=
l=3Dhttps"
>>>>> +
>>>>> +DEPENDS_append_ti-soc =3D " python3-cryptography-native"
>>>
>=20

