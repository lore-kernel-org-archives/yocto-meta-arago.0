Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED76C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 23:18:21 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.9097.1707175100820425882
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Feb 2024 15:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=pakC1kor;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 415NIK4j012717
	for <meta-arago@lists.yoctoproject.org>; Mon, 5 Feb 2024 17:18:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707175100;
	bh=do4ubWViZPcJa5kvheLa0JgA6WaTUH96uYQThh9uAt4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=pakC1kor2yjxll44dby3mid/dLd4OmF8lTIsO9HFl4hWHul2eTCAxk3Uyob5RXIJK
	 d18iz+p9X+XNG++XQ6u5jdVeT/OAFReGO0kiybYZIm8iNIpHfuh7bU4EONoSOXexi4
	 7qy9DavxIjBBcDp+sHxuujAXVuRSOxPDW/B23JW4=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 415NIKdZ036073
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 5 Feb 2024 17:18:20 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Feb 2024 17:18:19 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Feb 2024 17:18:19 -0600
Received: from [128.247.81.144] (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 415NIJ5g076780;
	Mon, 5 Feb 2024 17:18:19 -0600
Message-ID: <9525eb35-0205-4c52-9deb-b00ee99900c0@ti.com>
Date: Mon, 5 Feb 2024 17:18:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][kirkstone/master][PATCH] systemd: add network device
 conf files for persistent names of the mcan devices
Content-Language: en-US, en-US-large
To: <b-kapoor@ti.com>, "Limaye, Aniket" <a-limaye@ti.com>,
        Andrew Davis
	<afd@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <17AFF8B8425DEAB5.1968@lists.yoctoproject.org>
 <0e03969b-048e-4169-b56f-a9bcbc9dc0e7@ti.com>
 <5b0b7efc-6d8b-47ae-9cd0-61e21b742b41@ti.com>
 <1892315d-16b8-4367-b05c-4e6b2da0d647@ti.com>
 <b8a56668-fe75-4be0-be33-0cc496a09fbf@ti.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <b8a56668-fe75-4be0-be33-0cc496a09fbf@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 415NIK4j012717
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Feb 2024 23:18:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15113

On 2/5/24 01:18, Bhavya Kapoor via lists.yoctoproject.org wrote:
>=20
> On 05/02/24 12:18, Limaye, Aniket wrote:
>>
>> On 2/2/2024 10:23 PM, Andrew Davis wrote:
>>> On 2/2/24 2:09 AM, Aniket Limaye via lists.yoctoproject.org wrote:
>>>>
>>>> On 2/2/2024 12:14 PM, Aniket Limaye via lists.yoctoproject.org wrote=
:
>>>>> When multiple CAN's are present, then names that are getting assign=
ed change after every boot even after providing alias in the device tree.=
 So add per-platform link files to specify the interface name to use for =
each mcan device, to make it
>>>>> ZjQcmQRYFpfptBannerStart
>>>>> This message was sent from outside of Texas Instruments.
>>>>> Do not click links or open attachments unless you recognize the sou=
rce of this email and know the content is safe.
>>>>> ZjQcmQRYFpfptBannerEnd
>>>>> When multiple CAN's are present, then names that are getting assign=
ed
>>>>> change after every boot even after providing alias in the device
>>>>> tree.
>>>>> So add per-platform link files to specify the interface name to use=
 for
>>>>> each mcan device, to make it persistent across reboots.
>>>>>
>>>>> Signed-off-by: Bhavya Kapoor<b-kapoor@ti.com>
>>>>> Signed-off-by: Aniket Limaye<a-limaye@ti.com>
>>>>> ---
>>>>>  =C2=A0 .../systemd/j7200-evm/mcan-links.tar.gz=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | Bin 0 -> 687 bytes
>>>>>  =C2=A0 .../systemd/j721e-evm/mcan-links.tar.gz=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | Bin 0 -> 687 bytes
>>>>>  =C2=A0 .../systemd/j721s2-evm/mcan-links.tar.gz=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | Bin 0 -> 687 bytes
>>>>>  =C2=A0 .../systemd/j722s-evm/mcan-links.tar.gz=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | Bin 0 -> 293 bytes
>>>>>  =C2=A0 .../systemd/j784s4-evm/mcan-links.tar.gz=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | Bin 0 -> 687 bytes
>>>>>  =C2=A0 .../recipes-core/systemd/systemd_%.bbappend=C2=A0=C2=A0 |=C2=
=A0 50 +++++++++++++++++-
>>>>>  =C2=A0 6 files changed, 48 insertions(+), 2 deletions(-)
>>>>>  =C2=A0 create mode 100644 meta-arago-distro/recipes-core/systemd/s=
ystemd/j7200-evm/mcan-links.tar.gz
>>>>>  =C2=A0 create mode 100644 meta-arago-distro/recipes-core/systemd/s=
ystemd/j721e-evm/mcan-links.tar.gz
>>>>>  =C2=A0 create mode 100644 meta-arago-distro/recipes-core/systemd/s=
ystemd/j721s2-evm/mcan-links.tar.gz
>>>>>  =C2=A0 create mode 100644 meta-arago-distro/recipes-core/systemd/s=
ystemd/j722s-evm/mcan-links.tar.gz
>>>>>  =C2=A0 create mode 100644 meta-arago-distro/recipes-core/systemd/s=
ystemd/j784s4-evm/mcan-links.tar.gz
>>>>>
>>>>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/j7200-e=
vm/mcan-links.tar.gz b/meta-arago-distro/recipes-core/systemd/systemd/j72=
00-evm/mcan-links.tar.gz
>>>>> new file mode 100644
>>>>> index 0000000000000000000000000000000000000000..61fbf1019f11ebc1072=
07ca73a72072dc0bf573d
>>>>> GIT binary patch
>>>>> literal 687
>>>>> zcmb2|=3D3oE=3D=3DC`-bXWurEI953SbGSrVUfRiDiSk7fJr@r~Roz%S<x#36x9_D%=
yW0PL
>>>>> zFJ|8Cc3OI`gi7Rxngw4j1gPCwZ+-myr^Q+N-(J59&@I1x*jdoY)WB_Tomg1-|9U&Y
>>>>> ztvW52Zq2CrF~L=3DJ$;C|?s}=3DswGLM`0`(4B|*YX>7IaR+(_pMKV<@_`E$HwXL+j=
jf@
>>>>> zeEl)v-F5x%%j4URz74&;zW%;$USGfe?BxIHU%!6-dv^Kz>8qE=3DUgy`p8^6NqblQ)=
f
>>>>> zy6xBX^WyiPzx!y{?fkIi`4fJn9N75h`hJdb#t+})_rJY=3DjqC6659|KtRa?X|NF8H=
!
>>>>> zxaAh`mpg``=3D)o`X&#&Sa|Cc!NFFNeM?%n+!wI&G#e^0mkUH$!U^cQ*NoBJQ!Vf46=
t
>>>>> zQJi7subc<Zf2~iyx_{M$dY+R1O;`W(@A_}`_2z-|U)Mjoy5Hfy;f256VgIvt)lUU0
>>>>> zz5e-?{QLjzj^E=3Dq|N8IweSPqJ-aj$_)8hVKe__wItN!TA`*SK85`w^@WpRHW|BM$=
Y
>>>>> z`9JIG|C#IzW?)nApIKdR^S`_4-Te)}>_7jjpA0rO|M}JZjv%{$4o<)KKObVO@$LVQ
>>>>> z{@HV7{Xbp#Yq?hLiNE^K>?0+9^PB&ldCmUa|HTUb|9yUDFZ%Pj{OkETJ%8J0|Mz(<
>>>>> z|NVd9h5x`X)j#oX<G+)KZq)Did49{k!vFHDH|_KPDW60Z-T1%1>CJre|0|J1m;B@X
>>>>> z_CIjK-_6hL!zTVs{yVvK<Nt!s^E3Y@gN?}kmuz~|{u;s^FvZs<AS-_SvtA_S|C*ou
>>>>> ZTT}i=3D{D&k)RFdVR_{aB)1sEzA7yy@wl!E{O
>>>>>
>>>>> literal 0
>>>>> HcmV?d00001
>>>>>
>>>>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/j721e-e=
vm/mcan-links.tar.gz b/meta-arago-distro/recipes-core/systemd/systemd/j72=
1e-evm/mcan-links.tar.gz
>>>>> new file mode 100644
>>>>> index 0000000000000000000000000000000000000000..61fbf1019f11ebc1072=
07ca73a72072dc0bf573d
>>>>> GIT binary patch
>>>>> literal 687
>>>>> zcmb2|=3D3oE=3D=3DC`-bXWurEI953SbGSrVUfRiDiSk7fJr@r~Roz%S<x#36x9_D%=
yW0PL
>>>>> zFJ|8Cc3OI`gi7Rxngw4j1gPCwZ+-myr^Q+N-(J59&@I1x*jdoY)WB_Tomg1-|9U&Y
>>>>> ztvW52Zq2CrF~L=3DJ$;C|?s}=3DswGLM`0`(4B|*YX>7IaR+(_pMKV<@_`E$HwXL+j=
jf@
>>>>> zeEl)v-F5x%%j4URz74&;zW%;$USGfe?BxIHU%!6-dv^Kz>8qE=3DUgy`p8^6NqblQ)=
f
>>>>> zy6xBX^WyiPzx!y{?fkIi`4fJn9N75h`hJdb#t+})_rJY=3DjqC6659|KtRa?X|NF8H=
!
>>>>> zxaAh`mpg``=3D)o`X&#&Sa|Cc!NFFNeM?%n+!wI&G#e^0mkUH$!U^cQ*NoBJQ!Vf46=
t
>>>>> zQJi7subc<Zf2~iyx_{M$dY+R1O;`W(@A_}`_2z-|U)Mjoy5Hfy;f256VgIvt)lUU0
>>>>> zz5e-?{QLjzj^E=3Dq|N8IweSPqJ-aj$_)8hVKe__wItN!TA`*SK85`w^@WpRHW|BM$=
Y
>>>>> z`9JIG|C#IzW?)nApIKdR^S`_4-Te)}>_7jjpA0rO|M}JZjv%{$4o<)KKObVO@$LVQ
>>>>> z{@HV7{Xbp#Yq?hLiNE^K>?0+9^PB&ldCmUa|HTUb|9yUDFZ%Pj{OkETJ%8J0|Mz(<
>>>>> z|NVd9h5x`X)j#oX<G+)KZq)Did49{k!vFHDH|_KPDW60Z-T1%1>CJre|0|J1m;B@X
>>>>> z_CIjK-_6hL!zTVs{yVvK<Nt!s^E3Y@gN?}kmuz~|{u;s^FvZs<AS-_SvtA_S|C*ou
>>>>> ZTT}i=3D{D&k)RFdVR_{aB)1sEzA7yy@wl!E{O
>>>>>
>>>>> literal 0
>>>>> HcmV?d00001
>>>>>
>>>>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/j721s2-=
evm/mcan-links.tar.gz b/meta-arago-distro/recipes-core/systemd/systemd/j7=
21s2-evm/mcan-links.tar.gz
>>>>> new file mode 100644
>>>>> index 0000000000000000000000000000000000000000..61fbf1019f11ebc1072=
07ca73a72072dc0bf573d
>>>>> GIT binary patch
>>>>> literal 687
>>>>> zcmb2|=3D3oE=3D=3DC`-bXWurEI953SbGSrVUfRiDiSk7fJr@r~Roz%S<x#36x9_D%=
yW0PL
>>>>> zFJ|8Cc3OI`gi7Rxngw4j1gPCwZ+-myr^Q+N-(J59&@I1x*jdoY)WB_Tomg1-|9U&Y
>>>>> ztvW52Zq2CrF~L=3DJ$;C|?s}=3DswGLM`0`(4B|*YX>7IaR+(_pMKV<@_`E$HwXL+j=
jf@
>>>>> zeEl)v-F5x%%j4URz74&;zW%;$USGfe?BxIHU%!6-dv^Kz>8qE=3DUgy`p8^6NqblQ)=
f
>>>>> zy6xBX^WyiPzx!y{?fkIi`4fJn9N75h`hJdb#t+})_rJY=3DjqC6659|KtRa?X|NF8H=
!
>>>>> zxaAh`mpg``=3D)o`X&#&Sa|Cc!NFFNeM?%n+!wI&G#e^0mkUH$!U^cQ*NoBJQ!Vf46=
t
>>>>> zQJi7subc<Zf2~iyx_{M$dY+R1O;`W(@A_}`_2z-|U)Mjoy5Hfy;f256VgIvt)lUU0
>>>>> zz5e-?{QLjzj^E=3Dq|N8IweSPqJ-aj$_)8hVKe__wItN!TA`*SK85`w^@WpRHW|BM$=
Y
>>>>> z`9JIG|C#IzW?)nApIKdR^S`_4-Te)}>_7jjpA0rO|M}JZjv%{$4o<)KKObVO@$LVQ
>>>>> z{@HV7{Xbp#Yq?hLiNE^K>?0+9^PB&ldCmUa|HTUb|9yUDFZ%Pj{OkETJ%8J0|Mz(<
>>>>> z|NVd9h5x`X)j#oX<G+)KZq)Did49{k!vFHDH|_KPDW60Z-T1%1>CJre|0|J1m;B@X
>>>>> z_CIjK-_6hL!zTVs{yVvK<Nt!s^E3Y@gN?}kmuz~|{u;s^FvZs<AS-_SvtA_S|C*ou
>>>>> ZTT}i=3D{D&k)RFdVR_{aB)1sEzA7yy@wl!E{O
>>>>>
>>>>> literal 0
>>>>> HcmV?d00001
>>>>>
>>>>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/j722s-e=
vm/mcan-links.tar.gz b/meta-arago-distro/recipes-core/systemd/systemd/j72=
2s-evm/mcan-links.tar.gz
>>>>> new file mode 100644
>>>>> index 0000000000000000000000000000000000000000..7bfe5ab908ad970a8af=
821304884717cc24ab1b1
>>>>> GIT binary patch
>>>>> literal 293
>>>>> zcmV+=3D0owi_iwFP!000001MSvNOT#c6#_^u}DgvHY^UJ^Lp$9=3DkL1hPTV~kKLmb=
Kle
>>>>> z*}->jR&a<Tn9JIU&*zdu)6$TBOR`IKJ!?zb@vN!4b#e;aGe+%4$~FH!4oFf$N^4_e
>>>>> z&V@-h38Qqv_(|U8huyogJ!6UO>UHJ9^M1SjM_sT-zwPX<ZYuV=3D=3D~-LuR>S9zE}=
pC_
>>>>> z-<IjT-)yVieH0J3tNG2#eX(t<^HbZIs`!=3DPzRXWg7yHL7(`VaO#c=3D=3DB3xg=3D=
xSO0Wo
>>>>> z{TuW@hEV?$)jtLMr>PePQ4al!Df^d4{cA%1V>s&H)?M@gK=3D7PX=3Dno*KUK&I=3D=
^e@k>
>>>>> re}VqT5bQtZ0O0$lVE=3DOJr2zl{00000000000Q^gz5BrB?04M+e5bBlJ
>>>>>
>>>>> literal 0
>>>>> HcmV?d00001
>>>>>
>>>>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/j784s4-=
evm/mcan-links.tar.gz b/meta-arago-distro/recipes-core/systemd/systemd/j7=
84s4-evm/mcan-links.tar.gz
>>>>> new file mode 100644
>>>>> index 0000000000000000000000000000000000000000..61fbf1019f11ebc1072=
07ca73a72072dc0bf573d
>>>>> GIT binary patch
>>>>> literal 687
>>>>> zcmb2|=3D3oE=3D=3DC`-bXWurEI953SbGSrVUfRiDiSk7fJr@r~Roz%S<x#36x9_D%=
yW0PL
>>>>> zFJ|8Cc3OI`gi7Rxngw4j1gPCwZ+-myr^Q+N-(J59&@I1x*jdoY)WB_Tomg1-|9U&Y
>>>>> ztvW52Zq2CrF~L=3DJ$;C|?s}=3DswGLM`0`(4B|*YX>7IaR+(_pMKV<@_`E$HwXL+j=
jf@
>>>>> zeEl)v-F5x%%j4URz74&;zW%;$USGfe?BxIHU%!6-dv^Kz>8qE=3DUgy`p8^6NqblQ)=
f
>>>>> zy6xBX^WyiPzx!y{?fkIi`4fJn9N75h`hJdb#t+})_rJY=3DjqC6659|KtRa?X|NF8H=
!
>>>>> zxaAh`mpg``=3D)o`X&#&Sa|Cc!NFFNeM?%n+!wI&G#e^0mkUH$!U^cQ*NoBJQ!Vf46=
t
>>>>> zQJi7subc<Zf2~iyx_{M$dY+R1O;`W(@A_}`_2z-|U)Mjoy5Hfy;f256VgIvt)lUU0
>>>>> zz5e-?{QLjzj^E=3Dq|N8IweSPqJ-aj$_)8hVKe__wItN!TA`*SK85`w^@WpRHW|BM$=
Y
>>>>> z`9JIG|C#IzW?)nApIKdR^S`_4-Te)}>_7jjpA0rO|M}JZjv%{$4o<)KKObVO@$LVQ
>>>>> z{@HV7{Xbp#Yq?hLiNE^K>?0+9^PB&ldCmUa|HTUb|9yUDFZ%Pj{OkETJ%8J0|Mz(<
>>>>> z|NVd9h5x`X)j#oX<G+)KZq)Did49{k!vFHDH|_KPDW60Z-T1%1>CJre|0|J1m;B@X
>>>>> z_CIjK-_6hL!zTVs{yVvK<Nt!s^E3Y@gN?}kmuz~|{u;s^FvZs<AS-_SvtA_S|C*ou
>>>>> ZTT}i=3D{D&k)RFdVR_{aB)1sEzA7yy@wl!E{O
>>>>>
>>>>> literal 0
>>>>> HcmV?d00001
>>>>>
>>>>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbapp=
end b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
>>>>> index f38606f2..bd885e06 100644
>>>>> --- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
>>>>> +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
>>>>> @@ -1,6 +1,6 @@
>>>>> -PR:append =3D ".arago7"
>>>>> +PR:append =3D ".arago8"
>>>>> -FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
>>>>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}/${MACHINE}:${THISDI=
R}/${PN}:"
>>>>>  =C2=A0 SRC_URI:append =3D " \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://local.rules=C2=A0 \
>>>>> @@ -14,6 +14,26 @@ SRC_URI:append =3D " \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://timesyncd.conf=C2=A0 \
>>>>>  =C2=A0 "
>>>>> +SRC_URI:append:j7200-evm =3D " \
>>>>> +file://mcan-links.tar.gz=C2=A0 \
>>>>> +"
>>>>> +
>>>>> +SRC_URI:append:j721e-evm =3D " \
>>>>> +file://mcan-links.tar.gz=C2=A0 \
>>>>> +"
>>>>> +
>>>>> +SRC_URI:append:j721s2-evm =3D " \
>>>>> +file://mcan-links.tar.gz=C2=A0 \
>>>>> +"
>>>>> +
>>>>> +SRC_URI:append:j784s4-evm =3D " \
>>>>> +file://mcan-links.tar.gz=C2=A0 \
>>>>> +"
>>>>> +
>>>>> +SRC_URI:append:j722s-evm =3D " \
>>>>> +file://mcan-links.tar.gz=C2=A0 \
>>>>> +"
>>>>> +
>>>>
>>>> Hmm.. Is it better to explicitly add all the link files one by one? =
I was trying to not have the recipe too cluttered but maybe it's better t=
o have the individual files here instead of the tarball?
>>>> I can resend if people agree.
>>>>
>>>
>>> That would be better, but why do you need these links at all? You can
>>> make the names consistent between boots using udev rules as suggested
>>> by the kernel maintainers when you sent those alias patches.
>>>
>>> Look at the local.rules we already have, see how SYMLINK works.
>>>
>>> Andrew
>=20
> Hi Andrew, i also considered udev rules as my first go to for this but
>=20
> as i tried=C2=A0 Udev rules the aliasing purpose, it seems udev rules w=
ere not
>=20
> working properly for renaming in the can subsystem, so i had to switch =
to the
>=20
> systemd-networkd method which was another option for stable naming in
>=20
> linux (more better and efficient than udev) as mentioned by Marc on my =
earlier patch for aliasing.
>=20
> Regards
>=20
> ~B-Kapoor
> [snip]

Well, sure, similar result for now, but if someone switches the network=20
provider this will certainly break where udev rules wouldn't. That being=20
said I'm not opposed to it.

I am opposed to these living in the sysconfigdir if the goal is=20
persistent naming. Typically they should go in /usr/lib/systemd/network/=20
as /etc/systemd is reserved for user overrides, breaking systemctl edit=20
and such.

I'm also not entirely thrilled with tracking archives containing these=20
links instead of just the link files themselves...

Randolph

