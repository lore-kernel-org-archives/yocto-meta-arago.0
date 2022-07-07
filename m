Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B76C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 17:07:27 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.247.1657213643204033046
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 07 Jul 2022 10:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=kGbzxSFe;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 267H7Kk0056389;
	Thu, 7 Jul 2022 12:07:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1657213640;
	bh=//768ouJ9s5LncNyIP8gtWMdTUXUJ4v6KDEBzxg+1yk=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=kGbzxSFez/RICssC9cg+SsXOswKbgfHyJIYuBnWFST7VrZ/jueGf+RB91iO9arWBy
	 n5KqFgsbygy75QRiQA52sO4lC0RwcNzFKlWOlKdjGX9HrSr2XBIRrS7cL24VcMQGG/
	 fL573BnBttRCAjqiuPIwzFEj46J1HsxJQYJ23NhE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 267H7K3V127272
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 7 Jul 2022 12:07:20 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 7
 Jul 2022 12:07:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 7 Jul 2022 12:07:19 -0500
Received: from [10.250.37.187] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 267H7Ja3062270;
	Thu, 7 Jul 2022 12:07:19 -0500
Message-ID: <5a210eab-c490-abb5-59e2-531fcec0f8d0@ti.com>
Date: Thu, 7 Jul 2022 12:07:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-arago] [oe-layersetup][master][RFC] oe-layersetup: Add
 config option for dunfell/kirkstone
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <16FF8DBB7909D3F6.549@lists.yoctoproject.org>
 <e92a2e56-2b4d-d4f3-bed3-08a7cb954f15@ti.com>
 <48a57e56-590b-64fb-2afd-ae8bebecbe9a@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <48a57e56-590b-64fb-2afd-ae8bebecbe9a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id
 267H7Kk0056389
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 07 Jul 2022 17:07:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13942



On 7/7/2022 11:19, Andrew Davis wrote:
> On 7/7/22 8:05 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Andrew, Denys,
>>
>> What are your thoughts on this approach to fixing the variable name=20
>> change issue?
>>
>>
>=20
> How do we feel about just using BB_PRESERVE_ENV?
>=20
> Andrew

That has some potential issues with someone's environment having=20
something set that impacts the recipes and builds.  It could make it=20
harder to debug issues.  Right now the environment is tightly=20
controlled, with only variables in the list getting though, but this=20
just throws open the flood gates...


>>
>> On 7/7/2022 8:03, Ryan Eatmon via lists.yoctoproject.org wrote:
>>> Part of the transition to kirkstone was to rename some variables
>>> to align with community standards.=C2=A0 Since oe-layersetup needs to
>>> work with both dunfell and kirkstone, we need a way to control
>>> which branch we are pointing to so that we can put the correct
>>> variables in the conf/setenv file.
>>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>> =C2=A0 configs/arago-dunfell-config.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +
>>> =C2=A0 configs/arago-dunfell-next-config.txt=C2=A0=C2=A0 |=C2=A0 1 +
>>> =C2=A0 configs/arago-dunfell-wip-config.txt=C2=A0=C2=A0=C2=A0 |=C2=A0=
 1 +
>>> =C2=A0 configs/arago-kirkstone-config.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 1 +
>>> =C2=A0 configs/arago-master-config.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>> =C2=A0 configs/distroless-dunfell-config.txt=C2=A0=C2=A0 |=C2=A0 1 +
>>> =C2=A0 configs/distroless-kirkstone-config.txt |=C2=A0 1 +
>>> =C2=A0 configs/distroless-master-config.txt=C2=A0=C2=A0=C2=A0 |=C2=A0=
 1 +
>>> =C2=A0 configs/poky-dunfell-config.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>> =C2=A0 configs/poky-kirkstone-config.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 +
>>> =C2=A0 configs/poky-master-config.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>> =C2=A0 oe-layertool-setup.sh=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 29 +=
++++++++++++++++++++++--
>>> =C2=A0 12 files changed, 38 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/configs/arago-dunfell-config.txt=20
>>> b/configs/arago-dunfell-config.txt
>>> index 60cc72a..71aaa0b 100644
>>> --- a/configs/arago-dunfell-config.txt
>>> +++ b/configs/arago-dunfell-config.txt
>>> @@ -16,3 +16,4 @@ OECORELAYERCONF=3D./sample-files/bblayers.conf.samp=
le
>>> =C2=A0 # use below for OECORELAYERCONF to mark it compatible with dun=
fell
>>> =C2=A0 #OECORELAYERCONF=3D./sample-files/bblayers-dunfell-browser.con=
f.sample
>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64.conf.sample
>>> +BITBAKE_BRANCH=3Ddunfell
>>> diff --git a/configs/arago-dunfell-next-config.txt=20
>>> b/configs/arago-dunfell-next-config.txt
>>> index e2eb202..18984cd 100644
>>> --- a/configs/arago-dunfell-next-config.txt
>>> +++ b/configs/arago-dunfell-next-config.txt
>>> @@ -16,3 +16,4 @@ OECORELAYERCONF=3D./sample-files/bblayers.conf.samp=
le
>>> =C2=A0 # use below for OECORELAYERCONF to mark it compatible with dun=
fell
>>> =C2=A0 #OECORELAYERCONF=3D./sample-files/bblayers-dunfell-browser.con=
f.sample
>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64.conf.sample
>>> +BITBAKE_BRANCH=3Ddunfell
>>> diff --git a/configs/arago-dunfell-wip-config.txt=20
>>> b/configs/arago-dunfell-wip-config.txt
>>> index 60f9f0d..55a3b73 100644
>>> --- a/configs/arago-dunfell-wip-config.txt
>>> +++ b/configs/arago-dunfell-wip-config.txt
>>> @@ -16,3 +16,4 @@ OECORELAYERCONF=3D./sample-files/bblayers.conf.samp=
le
>>> =C2=A0 # use below for OECORELAYERCONF to mark it compatible with dun=
fell
>>> =C2=A0 #OECORELAYERCONF=3D./sample-files/bblayers-dunfell-browser.con=
f.sample
>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64.conf.sample
>>> +BITBAKE_BRANCH=3Ddunfell
>>> diff --git a/configs/arago-kirkstone-config.txt=20
>>> b/configs/arago-kirkstone-config.txt
>>> index 0f3c001..1666a18 100644
>>> --- a/configs/arago-kirkstone-config.txt
>>> +++ b/configs/arago-kirkstone-config.txt
>>> @@ -12,3 +12,4 @@=20
>>> meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=3D=
meta-arm:meta=20
>>>
>>>  =20
>>> oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,l=
ayers=3Dmeta=20
>>>
>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
>>> +BITBAKE_BRANCH=3Dkirkstone
>>> diff --git a/configs/arago-master-config.txt=20
>>> b/configs/arago-master-config.txt
>>> index 532a145..986ca6e 100644
>>> --- a/configs/arago-master-config.txt
>>> +++ b/configs/arago-master-config.txt
>>> @@ -12,3 +12,4 @@=20
>>> meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmet=
a-arm:meta-ar=20
>>>
>>>  =20
>>> oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,laye=
rs=3Dmeta=20
>>>
>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
>>> +BITBAKE_BRANCH=3Dmaster
>>> diff --git a/configs/distroless-dunfell-config.txt=20
>>> b/configs/distroless-dunfell-config.txt
>>> index 0d2ab28..923858f 100644
>>> --- a/configs/distroless-dunfell-config.txt
>>> +++ b/configs/distroless-dunfell-config.txt
>>> @@ -6,3 +6,4 @@=20
>>> meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,HEAD,layers=3Dme=
ta-arm:meta-a=20
>>>
>>>  =20
>>> oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,lay=
ers=3Dmeta=20
>>>
>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local.conf.sample
>>> +BITBAKE_BRANCH=3Ddunfell
>>> diff --git a/configs/distroless-kirkstone-config.txt=20
>>> b/configs/distroless-kirkstone-config.txt
>>> index 3b33992..288ab3b 100644
>>> --- a/configs/distroless-kirkstone-config.txt
>>> +++ b/configs/distroless-kirkstone-config.txt
>>> @@ -6,3 +6,4 @@=20
>>> meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=3D=
meta-arm:meta=20
>>>
>>>  =20
>>> oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,l=
ayers=3Dmeta=20
>>>
>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-v2.conf.sample
>>> +BITBAKE_BRANCH=3Dkirkstone
>>> diff --git a/configs/distroless-master-config.txt=20
>>> b/configs/distroless-master-config.txt
>>> index 5c55459..a355d0d 100644
>>> --- a/configs/distroless-master-config.txt
>>> +++ b/configs/distroless-master-config.txt
>>> @@ -6,3 +6,4 @@=20
>>> meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmet=
a-arm:meta-ar=20
>>>
>>>  =20
>>> oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,laye=
rs=3Dmeta=20
>>>
>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-v2.conf.sample
>>> +BITBAKE_BRANCH=3Dmaster
>>> diff --git a/configs/poky-dunfell-config.txt=20
>>> b/configs/poky-dunfell-config.txt
>>> index 6c768e7..60fa653 100644
>>> --- a/configs/poky-dunfell-config.txt
>>> +++ b/configs/poky-dunfell-config.txt
>>> @@ -6,3 +6,4 @@=20
>>> meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,HEAD,layers=3Dme=
ta-arm:meta-a=20
>>>
>>> =C2=A0 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
=3D
>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-poky.conf.sample
>>> +BITBAKE_BRANCH=3Ddunfell
>>> diff --git a/configs/poky-kirkstone-config.txt=20
>>> b/configs/poky-kirkstone-config.txt
>>> index 0e57c64..658e189 100644
>>> --- a/configs/poky-kirkstone-config.txt
>>> +++ b/configs/poky-kirkstone-config.txt
>>> @@ -8,3 +8,4 @@=20
>>> meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=3D=
meta-arm:meta=20
>>>
>>>  =20
>>> oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,l=
ayers=3Dmeta=20
>>>
>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-poky-v2.conf.sample
>>> +BITBAKE_BRANCH=3Dkirkstone
>>> diff --git a/configs/poky-master-config.txt=20
>>> b/configs/poky-master-config.txt
>>> index a541501..fe6b731 100644
>>> --- a/configs/poky-master-config.txt
>>> +++ b/configs/poky-master-config.txt
>>> @@ -8,3 +8,4 @@=20
>>> meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmet=
a-arm:meta-ar=20
>>>
>>>  =20
>>> oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,laye=
rs=3Dmeta=20
>>>
>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-poky-v2.conf.sample
>>> +BITBAKE_BRANCH=3Dmaster
>>> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
>>> index e05737b..50c6f1e 100755
>>> --- a/oe-layertool-setup.sh
>>> +++ b/oe-layertool-setup.sh
>>> @@ -1,4 +1,4 @@
>>> -#!/bin/sh
>>> +#!/bin/bash
>>> =C2=A0 # OE Build Enviroment Setup Script
>>> =C2=A0 #
>>> @@ -38,6 +38,7 @@ OECORELAYERCONF=3D"" # sample configuration file us=
ed=20
>>> for bblayers.conf
>>> =C2=A0 OECORELAYERCONFPATH=3D"" # stores the path of the OECORELAYERC=
ONFPATH=20
>>> variable
>>> =C2=A0 OECORELOCALCONF=3D"" # sample configuration file used for loca=
l.conf
>>> =C2=A0 OECORELOCALCONFPATH=3D"" # stores the path of the OECORELOCALC=
ONFPATH=20
>>> variable
>>> +BITBAKE_BRANCH=3D"dunfell"
>>> =C2=A0 outputfile=3D"" # file to save output to if -o is used
>>> =C2=A0 inputfile=3D"" # file containing initial layers if -f is used
>>> =C2=A0 interactive=3D"n" # flag for interactive mode.=C2=A0 Default i=
s n
>>> @@ -158,6 +159,14 @@ parse_oecore_line() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eval $var=3D$val
>>> =C2=A0 }
>>> +# Input is a line of the form BITBAKE.*=3Dvalue
>>> +parse_bitbake_line() {
>>> +=C2=A0=C2=A0=C2=A0 var=3D`echo $1 | cut -d=3D -f1`
>>> +=C2=A0=C2=A0=C2=A0 val=3D`echo $1 | cut -d=3D -f2`
>>> +=C2=A0=C2=A0=C2=A0 eval $var=3D$val
>>> +}
>>> +
>>> +
>>> =C2=A0 # Input is a repository description line as detailed in the us=
age=20
>>> section
>>> =C2=A0 # There is a second optional input that can be passed to prefi=
x the=20
>>> variable
>>> @@ -243,6 +252,15 @@ parse_input_file() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 continue
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # If the line starts with=
 OECORE then parse the OECORE setting
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo $line | grep -e "^BI=
TBAKE.*=3D" > /dev/null
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ "$?" =3D "0" ]
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p=
arse_bitbake_line $line
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 o=
utput=3D"$output""$line\n"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
ontinue
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Since the li=
ne is not a comment or an OECORE setting=20
>>> let's assume
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # it is a repo=
sitory information line and parse it
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_repo_lin=
e $line
>>> @@ -853,8 +871,15 @@ unset BITBAKEDIR
>>> =C2=A0 unset SCRIPTS
>>> =C2=A0 export PATH
>>> =C2=A0 export BUILDDIR=3D${builddir}
>>> -export BB_ENV_EXTRAWHITE=3D"MACHINE DISTRO TCMODE TCLIBC http_proxy=20
>>> ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID=20
>>> SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS=20
>>> PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD=20
>>> SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND=20
>>> TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5=20
>>> TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES=20
>>> TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE=20
>>> ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO=20
>>> TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE"
>>> =C2=A0 EOM
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if [ "$BITBAKE_BRANCH" =3D=3D "dunfell" ]; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "export BB_ENV_EXTRA=
WHITE=3D\"MACHINE DISTRO TCMODE=20
>>> TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy=20
>>> SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE=20
>>> BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE=20
>>> SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE=20
>>> TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5=20
>>> TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES=20
>>> TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE=20
>>> ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO=20
>>> TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE\"" >> $confdir/setenv
>>> +=C2=A0=C2=A0=C2=A0 fi
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if [[ "$BITBAKE_BRANCH" =3D=3D "kirkstone" || "$B=
ITBAKE_BRANCH" =3D=3D=20
>>> "master" ]]; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "export BB_ENV_PASST=
HROUGH_ADDITIONS=3D\"MACHINE DISTRO=20
>>> TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY=20
>>> no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE=20
>>> BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE=20
>>> SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE=20
>>> TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5=20
>>> TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES=20
>>> TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE=20
>>> ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO=20
>>> TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE\"" >> $confdir/setenv
>>> +=C2=A0=C2=A0=C2=A0 fi
>>> =C2=A0 }
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

