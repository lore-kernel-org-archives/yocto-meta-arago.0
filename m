Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67168CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 06:21:28 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.111854.1697437284405123088
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 15 Oct 2023 23:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=BDsdJ6OT;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39G6LNQB015764
	for <meta-arago@lists.yoctoproject.org>; Mon, 16 Oct 2023 01:21:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697437283;
	bh=IWp/pDVqCMk7V38hu+xUprmlbCYxPyOA+oQzg/idFTU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BDsdJ6OTYhWb6I3z6leVye3vpVrpRImsV5hgehlEPtoFwYK5Ja+tHRjruIgs0+43B
	 TFCe+uaQYn/jU2htuMM2Yp2m7Pb+5RVRhgBD5o+o90O+T3ZTHScPNRLHtxG2tm1TVp
	 A6MYWHjKpvbamYMX7WDe/CCJTnMJT2TzsbmpGFIA=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39G6LNEQ108405
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 16 Oct 2023 01:21:23 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Oct 2023 01:21:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Oct 2023 01:21:23 -0500
Received: from [172.24.227.238] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39G6LLc8077676;
	Mon, 16 Oct 2023 01:21:22 -0500
Message-ID: <f1d5bc84-c982-4676-99fa-9d72f3bb883d@ti.com>
Date: Mon, 16 Oct 2023 11:51:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-arago] [oe-layersetup][master][PATCH]
 configs: processor-sdk: Add new config for AM62xSIP
Content-Language: en-US
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>
References: <20231016053302.1009493-1-s-adivi@ti.com>
 <178E8180D45FCC80.8679@lists.yoctoproject.org>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <178E8180D45FCC80.8679@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 39G6LNQB015764
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 16 Oct 2023 06:21:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14934

Updated Acked-By

On 16/10/23 11:38, Chirag Shilwant via lists.yoctoproject.org wrote:
>
> On 16/10/23 11:03, Sai Sree Kartheek Adivi wrote:
>> Add new config processor-sdk-09.00.00-am62xxsip-config.txt for
>> 09.00 release of am62xxsip-evm machine
>>
>> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
>
>
> Acked-by: Chirag Shilwant <c-shilwant@ti.com>
>
>
>> ---
>> =C2=A0 ...processor-sdk-09.00.00-am62xxsip-config.txt | 18 +++++++++++=
+++++++
>> =C2=A0 1 file changed, 18 insertions(+)
>> =C2=A0 create mode 100644=20
>> configs/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.txt
>>
>> diff --git=20
>> a/configs/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.txt=20
>> b/configs/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.txt
>> new file mode 100644
>> index 0000000..220ef8e
>> --- /dev/null
>> +++ b/configs/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.tx=
t
>> @@ -0,0 +1,18 @@
>> +# This file takes repo entries in the format
>> +# repo name,repo uri,repo branch,repo=20
>> commit[,layers=3Dlayer1:layer2...:layern]
>> +
>> +bitbake,https://git.openembedded.org/bitbake,2.0,41b6684489d026175334=
4956042be2cc4adb0159=20
>>
>> +meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,kirkstone,6=
17ddf642233e7e83a86bb66c5b0edd268b93709,layers=3D=20
>>
>> +meta-processor-sdk,https://git.ti.com/git/processor-sdk/meta-processo=
r-sdk.git,kirkstone,09.00.00.003-AM62SIP,layers=3D=20
>>
>> +meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,09.00.00=
.011,layers=3Dmeta-arago-distro:meta-arago-extras:meta-arago-demos=20
>>
>> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f=
365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=3D=20
>>
>> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,31930afca=
79b74e0c788452d71356c1f045e7979,layers=3D=20
>>
>> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,=
kirkstone,2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07,layers=3D=20
>>
>> +meta-openembedded,https://git.openembedded.org/meta-openembedded,kirk=
stone,9c5541f7e18a1fac3b8dea71e1ebb8398d58e6ff,layers=3Dmeta-networking:m=
eta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia=20
>>
>> +meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,09.00.00.011,l=
ayers=3Dmeta-ti-extras:meta-ti-bsp=20
>>
>> +meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,b187fb9232ca=
0a6b5f8f90b4715958546fc41d73,layers=3Dmeta-arm:meta-arm-toolchain=20
>>
>> +#meta-clang,https://github.com/kraj/meta-clang,kirkstone,15e5c625ecf2=
adfdb8d05a7dae606953420d6db2,layers=3D=20
>>
>> +oe-core,https://git.openembedded.org/openembedded-core,kirkstone,be0b=
ca7eaa08948b6c4eabe63e68a6e14d8dad3b,layers=3Dmeta=20
>>
>> +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>> +OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
>> +BITBAKE_INCLUSIVE_VARS=3Dyes
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14933):=20
> https://lists.yoctoproject.org/g/meta-arago/message/14933
> Mute This Topic: https://lists.yoctoproject.org/mt/101990628/7030289
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub=20
> [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

