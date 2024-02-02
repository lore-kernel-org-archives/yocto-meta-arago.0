Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CABC48291
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 08:09:37 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.18419.1706861375486066570
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 02 Feb 2024 00:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=wVGfbfUg;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41289YZe003365
	for <meta-arago@lists.yoctoproject.org>; Fri, 2 Feb 2024 02:09:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706861374;
	bh=ohnI7pO+sBfC8HRzc+PYsMtaSD2cG/qTxUXN05cTqWc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=wVGfbfUgVHWd+mqVovdH7HRzj8UOdjTH/IEamsN8J2aEbMZzApJuTQpd4aEJruqlJ
	 UU5/LkL14A89/Em55aqQ1hJD7DkOT3KWGCnn13E226kJWqkms9NTAjQLfFjiswxODF
	 n8s0EFDQZne8fdNCVjXaD43fdvQhlLrD1DcHSnCE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41289YOd009891
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 2 Feb 2024 02:09:34 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Feb 2024 02:09:34 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Feb 2024 02:09:34 -0600
Received: from [10.249.128.249] ([10.249.128.249])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41289WYJ074592
	for <meta-arago@lists.yoctoproject.org>; Fri, 2 Feb 2024 02:09:33 -0600
Content-Type: multipart/alternative;
	boundary="------------aKuaQmI77ulvNm0lVUCQyw4B"
Message-ID: <0e03969b-048e-4169-b56f-a9bcbc9dc0e7@ti.com>
Date: Fri, 2 Feb 2024 13:39:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][kirkstone/master][PATCH] systemd: add
 network device conf files for persistent names of the mcan devices
Content-Language: en-US
To: <meta-arago@lists.yoctoproject.org>
References: <17AFF8B8425DEAB5.1968@lists.yoctoproject.org>
From: "Limaye, Aniket" <a-limaye@ti.com>
In-Reply-To: <17AFF8B8425DEAB5.1968@lists.yoctoproject.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 02 Feb 2024 08:09:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15105

--------------aKuaQmI77ulvNm0lVUCQyw4B
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 2/2/2024 12:14 PM, Aniket Limaye via lists.yoctoproject.org wrote:
> When multiple CAN's are present, then names that are getting assigned 
> change after every boot even after providing alias in the device tree. 
> So add per-platform link files to specify the interface name to use 
> for each mcan device, to make it
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source 
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> When multiple CAN's are present, then names that are getting assigned
> change after every boot even after providing alias in the device
> tree.
> So add per-platform link files to specify the interface name to use for
> each mcan device, to make it persistent across reboots.
>
> Signed-off-by: Bhavya Kapoor<b-kapoor@ti.com>
> Signed-off-by: Aniket Limaye<a-limaye@ti.com>
> ---
>   .../systemd/j7200-evm/mcan-links.tar.gz       | Bin 0 -> 687 bytes
>   .../systemd/j721e-evm/mcan-links.tar.gz       | Bin 0 -> 687 bytes
>   .../systemd/j721s2-evm/mcan-links.tar.gz      | Bin 0 -> 687 bytes
>   .../systemd/j722s-evm/mcan-links.tar.gz       | Bin 0 -> 293 bytes
>   .../systemd/j784s4-evm/mcan-links.tar.gz      | Bin 0 -> 687 bytes
>   .../recipes-core/systemd/systemd_%.bbappend   |  50 +++++++++++++++++-
>   6 files changed, 48 insertions(+), 2 deletions(-)
>   create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/j7200-evm/mcan-links.tar.gz
>   create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/j721e-evm/mcan-links.tar.gz
>   create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/j721s2-evm/mcan-links.tar.gz
>   create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/j722s-evm/mcan-links.tar.gz
>   create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/j784s4-evm/mcan-links.tar.gz
>
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/j7200-evm/mcan-links.tar.gz b/meta-arago-distro/recipes-core/systemd/systemd/j7200-evm/mcan-links.tar.gz
> new file mode 100644
> index 0000000000000000000000000000000000000000..61fbf1019f11ebc107207ca73a72072dc0bf573d
> GIT binary patch
> literal 687
> zcmb2|=3oE==C`-bXWurEI953SbGSrVUfRiDiSk7fJr@r~Roz%S<x#36x9_D%yW0PL
> zFJ|8Cc3OI`gi7Rxngw4j1gPCwZ+-myr^Q+N-(J59&@I1x*jdoY)WB_Tomg1-|9U&Y
> ztvW52Zq2CrF~L=J$;C|?s}=swGLM`0`(4B|*YX>7IaR+(_pMKV<@_`E$HwXL+jjf@
> zeEl)v-F5x%%j4URz74&;zW%;$USGfe?BxIHU%!6-dv^Kz>8qE=Ugy`p8^6NqblQ)f
> zy6xBX^WyiPzx!y{?fkIi`4fJn9N75h`hJdb#t+})_rJY=jqC6659|KtRa?X|NF8H!
> zxaAh`mpg``=)o`X&#&Sa|Cc!NFFNeM?%n+!wI&G#e^0mkUH$!U^cQ*NoBJQ!Vf46t
> zQJi7subc<Zf2~iyx_{M$dY+R1O;`W(@A_}`_2z-|U)Mjoy5Hfy;f256VgIvt)lUU0
> zz5e-?{QLjzj^E=q|N8IweSPqJ-aj$_)8hVKe__wItN!TA`*SK85`w^@WpRHW|BM$Y
> z`9JIG|C#IzW?)nApIKdR^S`_4-Te)}>_7jjpA0rO|M}JZjv%{$4o<)KKObVO@$LVQ
> z{@HV7{Xbp#Yq?hLiNE^K>?0+9^PB&ldCmUa|HTUb|9yUDFZ%Pj{OkETJ%8J0|Mz(<
> z|NVd9h5x`X)j#oX<G+)KZq)Did49{k!vFHDH|_KPDW60Z-T1%1>CJre|0|J1m;B@X
> z_CIjK-_6hL!zTVs{yVvK<Nt!s^E3Y@gN?}kmuz~|{u;s^FvZs<AS-_SvtA_S|C*ou
> ZTT}i={D&k)RFdVR_{aB)1sEzA7yy@wl!E{O
>
> literal 0
> HcmV?d00001
>
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/j721e-evm/mcan-links.tar.gz b/meta-arago-distro/recipes-core/systemd/systemd/j721e-evm/mcan-links.tar.gz
> new file mode 100644
> index 0000000000000000000000000000000000000000..61fbf1019f11ebc107207ca73a72072dc0bf573d
> GIT binary patch
> literal 687
> zcmb2|=3oE==C`-bXWurEI953SbGSrVUfRiDiSk7fJr@r~Roz%S<x#36x9_D%yW0PL
> zFJ|8Cc3OI`gi7Rxngw4j1gPCwZ+-myr^Q+N-(J59&@I1x*jdoY)WB_Tomg1-|9U&Y
> ztvW52Zq2CrF~L=J$;C|?s}=swGLM`0`(4B|*YX>7IaR+(_pMKV<@_`E$HwXL+jjf@
> zeEl)v-F5x%%j4URz74&;zW%;$USGfe?BxIHU%!6-dv^Kz>8qE=Ugy`p8^6NqblQ)f
> zy6xBX^WyiPzx!y{?fkIi`4fJn9N75h`hJdb#t+})_rJY=jqC6659|KtRa?X|NF8H!
> zxaAh`mpg``=)o`X&#&Sa|Cc!NFFNeM?%n+!wI&G#e^0mkUH$!U^cQ*NoBJQ!Vf46t
> zQJi7subc<Zf2~iyx_{M$dY+R1O;`W(@A_}`_2z-|U)Mjoy5Hfy;f256VgIvt)lUU0
> zz5e-?{QLjzj^E=q|N8IweSPqJ-aj$_)8hVKe__wItN!TA`*SK85`w^@WpRHW|BM$Y
> z`9JIG|C#IzW?)nApIKdR^S`_4-Te)}>_7jjpA0rO|M}JZjv%{$4o<)KKObVO@$LVQ
> z{@HV7{Xbp#Yq?hLiNE^K>?0+9^PB&ldCmUa|HTUb|9yUDFZ%Pj{OkETJ%8J0|Mz(<
> z|NVd9h5x`X)j#oX<G+)KZq)Did49{k!vFHDH|_KPDW60Z-T1%1>CJre|0|J1m;B@X
> z_CIjK-_6hL!zTVs{yVvK<Nt!s^E3Y@gN?}kmuz~|{u;s^FvZs<AS-_SvtA_S|C*ou
> ZTT}i={D&k)RFdVR_{aB)1sEzA7yy@wl!E{O
>
> literal 0
> HcmV?d00001
>
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/j721s2-evm/mcan-links.tar.gz b/meta-arago-distro/recipes-core/systemd/systemd/j721s2-evm/mcan-links.tar.gz
> new file mode 100644
> index 0000000000000000000000000000000000000000..61fbf1019f11ebc107207ca73a72072dc0bf573d
> GIT binary patch
> literal 687
> zcmb2|=3oE==C`-bXWurEI953SbGSrVUfRiDiSk7fJr@r~Roz%S<x#36x9_D%yW0PL
> zFJ|8Cc3OI`gi7Rxngw4j1gPCwZ+-myr^Q+N-(J59&@I1x*jdoY)WB_Tomg1-|9U&Y
> ztvW52Zq2CrF~L=J$;C|?s}=swGLM`0`(4B|*YX>7IaR+(_pMKV<@_`E$HwXL+jjf@
> zeEl)v-F5x%%j4URz74&;zW%;$USGfe?BxIHU%!6-dv^Kz>8qE=Ugy`p8^6NqblQ)f
> zy6xBX^WyiPzx!y{?fkIi`4fJn9N75h`hJdb#t+})_rJY=jqC6659|KtRa?X|NF8H!
> zxaAh`mpg``=)o`X&#&Sa|Cc!NFFNeM?%n+!wI&G#e^0mkUH$!U^cQ*NoBJQ!Vf46t
> zQJi7subc<Zf2~iyx_{M$dY+R1O;`W(@A_}`_2z-|U)Mjoy5Hfy;f256VgIvt)lUU0
> zz5e-?{QLjzj^E=q|N8IweSPqJ-aj$_)8hVKe__wItN!TA`*SK85`w^@WpRHW|BM$Y
> z`9JIG|C#IzW?)nApIKdR^S`_4-Te)}>_7jjpA0rO|M}JZjv%{$4o<)KKObVO@$LVQ
> z{@HV7{Xbp#Yq?hLiNE^K>?0+9^PB&ldCmUa|HTUb|9yUDFZ%Pj{OkETJ%8J0|Mz(<
> z|NVd9h5x`X)j#oX<G+)KZq)Did49{k!vFHDH|_KPDW60Z-T1%1>CJre|0|J1m;B@X
> z_CIjK-_6hL!zTVs{yVvK<Nt!s^E3Y@gN?}kmuz~|{u;s^FvZs<AS-_SvtA_S|C*ou
> ZTT}i={D&k)RFdVR_{aB)1sEzA7yy@wl!E{O
>
> literal 0
> HcmV?d00001
>
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/j722s-evm/mcan-links.tar.gz b/meta-arago-distro/recipes-core/systemd/systemd/j722s-evm/mcan-links.tar.gz
> new file mode 100644
> index 0000000000000000000000000000000000000000..7bfe5ab908ad970a8af821304884717cc24ab1b1
> GIT binary patch
> literal 293
> zcmV+=0owi_iwFP!000001MSvNOT#c6#_^u}DgvHY^UJ^Lp$9=kL1hPTV~kKLmbKle
> z*}->jR&a<Tn9JIU&*zdu)6$TBOR`IKJ!?zb@vN!4b#e;aGe+%4$~FH!4oFf$N^4_e
> z&V@-h38Qqv_(|U8huyogJ!6UO>UHJ9^M1SjM_sT-zwPX<ZYuV==~-LuR>S9zE}pC_
> z-<IjT-)yVieH0J3tNG2#eX(t<^HbZIs`!=PzRXWg7yHL7(`VaO#c==B3xg=xSO0Wo
> z{TuW@hEV?$)jtLMr>PePQ4al!Df^d4{cA%1V>s&H)?M@gK=7PX=no*KUK&I=^e@k>
> re}VqT5bQtZ0O0$lVE=OJr2zl{00000000000Q^gz5BrB?04M+e5bBlJ
>
> literal 0
> HcmV?d00001
>
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/j784s4-evm/mcan-links.tar.gz b/meta-arago-distro/recipes-core/systemd/systemd/j784s4-evm/mcan-links.tar.gz
> new file mode 100644
> index 0000000000000000000000000000000000000000..61fbf1019f11ebc107207ca73a72072dc0bf573d
> GIT binary patch
> literal 687
> zcmb2|=3oE==C`-bXWurEI953SbGSrVUfRiDiSk7fJr@r~Roz%S<x#36x9_D%yW0PL
> zFJ|8Cc3OI`gi7Rxngw4j1gPCwZ+-myr^Q+N-(J59&@I1x*jdoY)WB_Tomg1-|9U&Y
> ztvW52Zq2CrF~L=J$;C|?s}=swGLM`0`(4B|*YX>7IaR+(_pMKV<@_`E$HwXL+jjf@
> zeEl)v-F5x%%j4URz74&;zW%;$USGfe?BxIHU%!6-dv^Kz>8qE=Ugy`p8^6NqblQ)f
> zy6xBX^WyiPzx!y{?fkIi`4fJn9N75h`hJdb#t+})_rJY=jqC6659|KtRa?X|NF8H!
> zxaAh`mpg``=)o`X&#&Sa|Cc!NFFNeM?%n+!wI&G#e^0mkUH$!U^cQ*NoBJQ!Vf46t
> zQJi7subc<Zf2~iyx_{M$dY+R1O;`W(@A_}`_2z-|U)Mjoy5Hfy;f256VgIvt)lUU0
> zz5e-?{QLjzj^E=q|N8IweSPqJ-aj$_)8hVKe__wItN!TA`*SK85`w^@WpRHW|BM$Y
> z`9JIG|C#IzW?)nApIKdR^S`_4-Te)}>_7jjpA0rO|M}JZjv%{$4o<)KKObVO@$LVQ
> z{@HV7{Xbp#Yq?hLiNE^K>?0+9^PB&ldCmUa|HTUb|9yUDFZ%Pj{OkETJ%8J0|Mz(<
> z|NVd9h5x`X)j#oX<G+)KZq)Did49{k!vFHDH|_KPDW60Z-T1%1>CJre|0|J1m;B@X
> z_CIjK-_6hL!zTVs{yVvK<Nt!s^E3Y@gN?}kmuz~|{u;s^FvZs<AS-_SvtA_S|C*ou
> ZTT}i={D&k)RFdVR_{aB)1sEzA7yy@wl!E{O
>
> literal 0
> HcmV?d00001
>
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> index f38606f2..bd885e06 100644
> --- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> @@ -1,6 +1,6 @@
> -PR:append = ".arago7"
> +PR:append = ".arago8"
>   
> -FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/${MACHINE}:${THISDIR}/${PN}:"
>   
>   SRC_URI:append = " \
>       file://local.rules  \
> @@ -14,6 +14,26 @@ SRC_URI:append = " \
>       file://timesyncd.conf  \
>   "
>   
> +SRC_URI:append:j7200-evm = " \
> +file://mcan-links.tar.gz  \
> +"
> +
> +SRC_URI:append:j721e-evm = " \
> +file://mcan-links.tar.gz  \
> +"
> +
> +SRC_URI:append:j721s2-evm = " \
> +file://mcan-links.tar.gz  \
> +"
> +
> +SRC_URI:append:j784s4-evm = " \
> +file://mcan-links.tar.gz  \
> +"
> +
> +SRC_URI:append:j722s-evm = " \
> +file://mcan-links.tar.gz  \
> +"
> +

Hmm.. Is it better to explicitly add all the link files one by one? I 
was trying to not have the recipe too cluttered but maybe it's better to 
have the individual files here instead of the tarball?
I can resend if people agree.

Regards,

Aniket

>   do_install:append() {
>       install -d ${D}${sysconfdir}/udev/rules.d/
>       install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/
> @@ -43,3 +63,29 @@ do_install:append() {
>       install -d ${D}${sysconfdir}/systemd/
>       install -m 0644 ${WORKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/
>   }
> +
> +do_install:append:j7200-evm() {
> +    install -d ${D}${sysconfdir}/systemd/network/
> +    install -m 0644 ${WORKDIR}/49-mcan*.link ${D}${sysconfdir}/systemd/network/
> +}
> +
> +do_install:append:j721e-evm() {
> +    install -d ${D}${sysconfdir}/systemd/network/
> +    install -m 0644 ${WORKDIR}/49-mcan*.link ${D}${sysconfdir}/systemd/network/
> +}
> +
> +do_install:append:j721s2-evm() {
> +    install -d ${D}${sysconfdir}/systemd/network/
> +    install -m 0644 ${WORKDIR}/49-mcan*.link ${D}${sysconfdir}/systemd/network/
> +}
> +
> +do_install:append:j784s4-evm() {
> +    install -d ${D}${sysconfdir}/systemd/network/
> +    install -m 0644 ${WORKDIR}/49-mcan*.link ${D}${sysconfdir}/systemd/network/
> +}
> +
> +do_install:append:j722s-evm() {
> +    install -d ${D}${sysconfdir}/systemd/network/
> +    install -m 0644 ${WORKDIR}/49-mcan*.link ${D}${sysconfdir}/systemd/network/
> +}
> +
> -- 
> 2.34.1
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15104):https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-arago/message/15104__;!!G3vK!V3qGKp5og0vb6WAjob_9PGqNUM5ApySsf5EZn71g_v8hFCwQ5iqyYi-ytCxLsTGuaKUCnRuSGgKvq2VoGjGYzQ7ROq1-VTl_Cw$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/104115039/6607860__;!!G3vK!V3qGKp5og0vb6WAjob_9PGqNUM5ApySsf5EZn71g_v8hFCwQ5iqyYi-ytCxLsTGuaKUCnRuSGgKvq2VoGjGYzQ7ROq2aSTXLqQ$
> Group Owner:meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-arago/unsub__;!!G3vK!V3qGKp5og0vb6WAjob_9PGqNUM5ApySsf5EZn71g_v8hFCwQ5iqyYi-ytCxLsTGuaKUCnRuSGgKvq2VoGjGYzQ7ROq0fgBNmLQ$  [a-limaye@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>
--------------aKuaQmI77ulvNm0lVUCQyw4B
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 41289YZe003365

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2/2/2024 12:14 PM, Aniket Limaye vi=
a
      lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:17AFF8B8425DEAB5.1968@lists.yoctoproject.org">
      <!-- BaNnErBlUrFlE-BoDy-start -->
      <!-- Preheader Text : BEGIN -->
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <div
style=3D"display:none !important;display:none;visibility:hidden;mso-hide:=
all;font-size:1px;color:#ffffff;line-height:1px;height:0px;max-height:0px=
;opacity:0;overflow:hidden;">
        When multiple CAN's are present, then names that are getting
        assigned change after every boot even after providing alias in
        the device tree. So add per-platform link files to specify the
        interface name to use for each mcan device, to make it
      </div>
      <!-- Preheader Text : END -->
      <!-- Email Banner : BEGIN -->
      <div
style=3D"display:none !important;display:none;visibility:hidden;mso-hide:=
all;font-size:1px;color:#ffffff;line-height:1px;height:0px;max-height:0px=
;opacity:0;overflow:hidden;">ZjQcmQRYFpfptBannerStart</div>
      <!--[if ((ie)|(mso))]>
  <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" =
style=3D"padding: 16px 0px 16px 0px; direction: ltr" lang=3D"en"><tr><td>
    <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"padd=
ing: 0px 10px 5px 6px; width: 100%; border-radius:4px; border-top:4px sol=
id #90a4ae;background-color:#D0D8DC;"><tr><td valign=3D"top">
      <table align=3D"left" border=3D"0" cellspacing=3D"0" cellpadding=3D=
"0" style=3D"padding: 4px 8px 4px 8px">
	<tr><td style=3D"color:#000000; font-family: 'Arial', sans-serif; font-w=
eight:bold; font-size:14px; direction: ltr">
	  This message was sent from outside of Texas Instruments.
	</td></tr>
	<tr><td style=3D"color:#000000; font-weight:normal; font-family: 'Arial'=
, sans-serif; font-size:12px; direction: ltr">
          Do not click links or open attachments unless you recognize the=
 source of this email and know the content is safe.
	</td></tr>

      </table>

    </td></tr></table>
  </td></tr></table>
<![endif]-->
      <!--[if !((ie)|(mso))]-->
      <div dir=3D"ltr" id=3D"pfptBannertzjkqaq"
style=3D"all: revert !important; display:block !important; text-align: le=
ft !important; margin:16px 0px 16px 0px !important; padding:8px 16px 8px =
16px !important; border-radius: 4px !important; min-width: 200px !importa=
nt; background-color: #D0D8DC !important; background-color: #D0D8DC; bord=
er-top: 4px solid #90a4ae !important; border-top: 4px solid #90a4ae;"
        lang=3D"en">
        <div id=3D"pfptBannertzjkqaq"
style=3D"all: unset !important; float:left !important; display:block !imp=
ortant; margin: 0px 0px 1px 0px !important; max-width: 600px !important;"=
>
          <div id=3D"pfptBannertzjkqaq"
style=3D"all: unset !important; display:block !important; visibility: vis=
ible !important; background-color: #D0D8DC !important; color:#000000 !imp=
ortant; color:#000000; font-family: 'Arial', sans-serif !important; font-=
family: 'Arial', sans-serif; font-weight:bold !important; font-weight:bol=
d; font-size:14px !important; line-height:18px !important; line-height:18=
px">
            This message was sent from outside of Texas Instruments. </di=
v>
          <div id=3D"pfptBannertzjkqaq"
style=3D"all: unset !important; display:block !important; visibility: vis=
ible !important; background-color: #D0D8DC !important; color:#000000 !imp=
ortant; color:#000000; font-weight:normal; font-family: 'Arial', sans-ser=
if !important; font-family: 'Arial', sans-serif; font-size:12px !importan=
t; line-height:18px !important; line-height:18px; margin-top:2px !importa=
nt;">
            Do not click links or open attachments unless you recognize
            the source of this email and know the content is safe. </div>
        </div>
        <div
style=3D"clear: both !important; display: block !important; visibility: h=
idden !important; line-height: 0 !important; font-size: 0.01px !important=
; height: 0px">=C2=A0</div>
      </div>
      <!--[endif]-->
      <div
style=3D"display:none !important;display:none;visibility:hidden;mso-hide:=
all;font-size:1px;color:#ffffff;line-height:1px;height:0px;max-height:0px=
;opacity:0;overflow:hidden;">ZjQcmQRYFpfptBannerEnd</div>
      <!-- Email Banner : END -->
      <!-- BaNnErBlUrFlE-BoDy-end -->
      <!-- BaNnErBlUrFlE-HeAdEr-start -->
      <style>#pfptBannertzjkqaq { all: revert !important; display: block =
!important;=20
    visibility: visible !important; opacity: 1 !important;=20
    background-color: #D0D8DC !important;=20
    max-width: none !important; max-height: none !important }.pfptPrimary=
Buttontzjkqaq:hover, .pfptPrimaryButtontzjkqaq:focus {
    background-color: #b4c1c7 !important; }.pfptPrimaryButtontzjkqaq:acti=
ve {
    background-color: #90a4ae !important; }</style>
      <!-- BaNnErBlUrFlE-HeAdEr-end -->
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">When multiple CAN's are present, then names that =
are getting assigned
change after every boot even after providing alias in the device
tree.
So add per-platform link files to specify the interface name to use for
each mcan device, to make it persistent across reboots.

Signed-off-by: Bhavya Kapoor <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:b-kapoor@ti.com">&lt;b-kapoor@ti.com&gt;</a>
Signed-off-by: Aniket Limaye <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:a-limaye@ti.com">&lt;a-limaye@ti.com&gt;</a>
---
 .../systemd/j7200-evm/mcan-links.tar.gz       | Bin 0 -&gt; 687 bytes
 .../systemd/j721e-evm/mcan-links.tar.gz       | Bin 0 -&gt; 687 bytes
 .../systemd/j721s2-evm/mcan-links.tar.gz      | Bin 0 -&gt; 687 bytes
 .../systemd/j722s-evm/mcan-links.tar.gz       | Bin 0 -&gt; 293 bytes
 .../systemd/j784s4-evm/mcan-links.tar.gz      | Bin 0 -&gt; 687 bytes
 .../recipes-core/systemd/systemd_%.bbappend   |  50 +++++++++++++++++-
 6 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/j7200-=
evm/mcan-links.tar.gz
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/j721e-=
evm/mcan-links.tar.gz
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/j721s2=
-evm/mcan-links.tar.gz
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/j722s-=
evm/mcan-links.tar.gz
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/j784s4=
-evm/mcan-links.tar.gz

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/j7200-evm/mca=
n-links.tar.gz b/meta-arago-distro/recipes-core/systemd/systemd/j7200-evm=
/mcan-links.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..61fbf1019f11ebc107207ca73=
a72072dc0bf573d
GIT binary patch
literal 687
zcmb2|=3D3oE=3D=3DC`-bXWurEI953SbGSrVUfRiDiSk7fJr@r~Roz%S&lt;x#36x9_D%yW0=
PL
zFJ|8Cc3OI`gi7Rxngw4j1gPCwZ+-myr^Q+N-(J59&amp;@I1x*jdoY)WB_Tomg1-|9U&amp;=
Y
ztvW52Zq2CrF~L=3DJ$;C|?s}=3DswGLM`0`(4B|*YX&gt;7IaR+(_pMKV&lt;@_`E$HwXL+j=
jf@
zeEl)v-F5x%%j4URz74&amp;;zW%;$USGfe?BxIHU%!6-dv^Kz&gt;8qE=3DUgy`p8^6NqblQ=
)f
zy6xBX^WyiPzx!y{?fkIi`4fJn9N75h`hJdb#t+})_rJY=3DjqC6659|KtRa?X|NF8H!
zxaAh`mpg``=3D)o`X&amp;#&amp;Sa|Cc!NFFNeM?%n+!wI&amp;G#e^0mkUH$!U^cQ*NoBJ=
Q!Vf46t
zQJi7subc&lt;Zf2~iyx_{M$dY+R1O;`W(@A_}`_2z-|U)Mjoy5Hfy;f256VgIvt)lUU0
zz5e-?{QLjzj^E=3Dq|N8IweSPqJ-aj$_)8hVKe__wItN!TA`*SK85`w^@WpRHW|BM$Y
z`9JIG|C#IzW?)nApIKdR^S`_4-Te)}&gt;_7jjpA0rO|M}JZjv%{$4o&lt;)KKObVO@$LVQ
z{@HV7{Xbp#Yq?hLiNE^K&gt;?0+9^PB&amp;ldCmUa|HTUb|9yUDFZ%Pj{OkETJ%8J0|Mz(&=
lt;
z|NVd9h5x`X)j#oX&lt;G+)KZq)Did49{k!vFHDH|_KPDW60Z-T1%1&gt;CJre|0|J1m;B@X
z_CIjK-_6hL!zTVs{yVvK&lt;Nt!s^E3Y@gN?}kmuz~|{u;s^FvZs&lt;AS-_SvtA_S|C*ou
ZTT}i=3D{D&amp;k)RFdVR_{aB)1sEzA7yy@wl!E{O

literal 0
HcmV?d00001

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/j721e-evm/mca=
n-links.tar.gz b/meta-arago-distro/recipes-core/systemd/systemd/j721e-evm=
/mcan-links.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..61fbf1019f11ebc107207ca73=
a72072dc0bf573d
GIT binary patch
literal 687
zcmb2|=3D3oE=3D=3DC`-bXWurEI953SbGSrVUfRiDiSk7fJr@r~Roz%S&lt;x#36x9_D%yW0=
PL
zFJ|8Cc3OI`gi7Rxngw4j1gPCwZ+-myr^Q+N-(J59&amp;@I1x*jdoY)WB_Tomg1-|9U&amp;=
Y
ztvW52Zq2CrF~L=3DJ$;C|?s}=3DswGLM`0`(4B|*YX&gt;7IaR+(_pMKV&lt;@_`E$HwXL+j=
jf@
zeEl)v-F5x%%j4URz74&amp;;zW%;$USGfe?BxIHU%!6-dv^Kz&gt;8qE=3DUgy`p8^6NqblQ=
)f
zy6xBX^WyiPzx!y{?fkIi`4fJn9N75h`hJdb#t+})_rJY=3DjqC6659|KtRa?X|NF8H!
zxaAh`mpg``=3D)o`X&amp;#&amp;Sa|Cc!NFFNeM?%n+!wI&amp;G#e^0mkUH$!U^cQ*NoBJ=
Q!Vf46t
zQJi7subc&lt;Zf2~iyx_{M$dY+R1O;`W(@A_}`_2z-|U)Mjoy5Hfy;f256VgIvt)lUU0
zz5e-?{QLjzj^E=3Dq|N8IweSPqJ-aj$_)8hVKe__wItN!TA`*SK85`w^@WpRHW|BM$Y
z`9JIG|C#IzW?)nApIKdR^S`_4-Te)}&gt;_7jjpA0rO|M}JZjv%{$4o&lt;)KKObVO@$LVQ
z{@HV7{Xbp#Yq?hLiNE^K&gt;?0+9^PB&amp;ldCmUa|HTUb|9yUDFZ%Pj{OkETJ%8J0|Mz(&=
lt;
z|NVd9h5x`X)j#oX&lt;G+)KZq)Did49{k!vFHDH|_KPDW60Z-T1%1&gt;CJre|0|J1m;B@X
z_CIjK-_6hL!zTVs{yVvK&lt;Nt!s^E3Y@gN?}kmuz~|{u;s^FvZs&lt;AS-_SvtA_S|C*ou
ZTT}i=3D{D&amp;k)RFdVR_{aB)1sEzA7yy@wl!E{O

literal 0
HcmV?d00001

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/j721s2-evm/mc=
an-links.tar.gz b/meta-arago-distro/recipes-core/systemd/systemd/j721s2-e=
vm/mcan-links.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..61fbf1019f11ebc107207ca73=
a72072dc0bf573d
GIT binary patch
literal 687
zcmb2|=3D3oE=3D=3DC`-bXWurEI953SbGSrVUfRiDiSk7fJr@r~Roz%S&lt;x#36x9_D%yW0=
PL
zFJ|8Cc3OI`gi7Rxngw4j1gPCwZ+-myr^Q+N-(J59&amp;@I1x*jdoY)WB_Tomg1-|9U&amp;=
Y
ztvW52Zq2CrF~L=3DJ$;C|?s}=3DswGLM`0`(4B|*YX&gt;7IaR+(_pMKV&lt;@_`E$HwXL+j=
jf@
zeEl)v-F5x%%j4URz74&amp;;zW%;$USGfe?BxIHU%!6-dv^Kz&gt;8qE=3DUgy`p8^6NqblQ=
)f
zy6xBX^WyiPzx!y{?fkIi`4fJn9N75h`hJdb#t+})_rJY=3DjqC6659|KtRa?X|NF8H!
zxaAh`mpg``=3D)o`X&amp;#&amp;Sa|Cc!NFFNeM?%n+!wI&amp;G#e^0mkUH$!U^cQ*NoBJ=
Q!Vf46t
zQJi7subc&lt;Zf2~iyx_{M$dY+R1O;`W(@A_}`_2z-|U)Mjoy5Hfy;f256VgIvt)lUU0
zz5e-?{QLjzj^E=3Dq|N8IweSPqJ-aj$_)8hVKe__wItN!TA`*SK85`w^@WpRHW|BM$Y
z`9JIG|C#IzW?)nApIKdR^S`_4-Te)}&gt;_7jjpA0rO|M}JZjv%{$4o&lt;)KKObVO@$LVQ
z{@HV7{Xbp#Yq?hLiNE^K&gt;?0+9^PB&amp;ldCmUa|HTUb|9yUDFZ%Pj{OkETJ%8J0|Mz(&=
lt;
z|NVd9h5x`X)j#oX&lt;G+)KZq)Did49{k!vFHDH|_KPDW60Z-T1%1&gt;CJre|0|J1m;B@X
z_CIjK-_6hL!zTVs{yVvK&lt;Nt!s^E3Y@gN?}kmuz~|{u;s^FvZs&lt;AS-_SvtA_S|C*ou
ZTT}i=3D{D&amp;k)RFdVR_{aB)1sEzA7yy@wl!E{O

literal 0
HcmV?d00001

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/j722s-evm/mca=
n-links.tar.gz b/meta-arago-distro/recipes-core/systemd/systemd/j722s-evm=
/mcan-links.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..7bfe5ab908ad970a8af821304=
884717cc24ab1b1
GIT binary patch
literal 293
zcmV+=3D0owi_iwFP!000001MSvNOT#c6#_^u}DgvHY^UJ^Lp$9=3DkL1hPTV~kKLmbKle
z*}-&gt;jR&amp;a&lt;Tn9JIU&amp;*zdu)6$TBOR`IKJ!?zb@vN!4b#e;aGe+%4$~FH!4oF=
f$N^4_e
z&amp;V@-h38Qqv_(|U8huyogJ!6UO&gt;UHJ9^M1SjM_sT-zwPX&lt;ZYuV=3D=3D~-LuR&g=
t;S9zE}pC_
z-&lt;IjT-)yVieH0J3tNG2#eX(t&lt;^HbZIs`!=3DPzRXWg7yHL7(`VaO#c=3D=3DB3xg=3D=
xSO0Wo
z{TuW@hEV?$)jtLMr&gt;PePQ4al!Df^d4{cA%1V&gt;s&amp;H)?M@gK=3D7PX=3Dno*KUK&=
amp;I=3D^e@k&gt;
re}VqT5bQtZ0O0$lVE=3DOJr2zl{00000000000Q^gz5BrB?04M+e5bBlJ

literal 0
HcmV?d00001

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/j784s4-evm/mc=
an-links.tar.gz b/meta-arago-distro/recipes-core/systemd/systemd/j784s4-e=
vm/mcan-links.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..61fbf1019f11ebc107207ca73=
a72072dc0bf573d
GIT binary patch
literal 687
zcmb2|=3D3oE=3D=3DC`-bXWurEI953SbGSrVUfRiDiSk7fJr@r~Roz%S&lt;x#36x9_D%yW0=
PL
zFJ|8Cc3OI`gi7Rxngw4j1gPCwZ+-myr^Q+N-(J59&amp;@I1x*jdoY)WB_Tomg1-|9U&amp;=
Y
ztvW52Zq2CrF~L=3DJ$;C|?s}=3DswGLM`0`(4B|*YX&gt;7IaR+(_pMKV&lt;@_`E$HwXL+j=
jf@
zeEl)v-F5x%%j4URz74&amp;;zW%;$USGfe?BxIHU%!6-dv^Kz&gt;8qE=3DUgy`p8^6NqblQ=
)f
zy6xBX^WyiPzx!y{?fkIi`4fJn9N75h`hJdb#t+})_rJY=3DjqC6659|KtRa?X|NF8H!
zxaAh`mpg``=3D)o`X&amp;#&amp;Sa|Cc!NFFNeM?%n+!wI&amp;G#e^0mkUH$!U^cQ*NoBJ=
Q!Vf46t
zQJi7subc&lt;Zf2~iyx_{M$dY+R1O;`W(@A_}`_2z-|U)Mjoy5Hfy;f256VgIvt)lUU0
zz5e-?{QLjzj^E=3Dq|N8IweSPqJ-aj$_)8hVKe__wItN!TA`*SK85`w^@WpRHW|BM$Y
z`9JIG|C#IzW?)nApIKdR^S`_4-Te)}&gt;_7jjpA0rO|M}JZjv%{$4o&lt;)KKObVO@$LVQ
z{@HV7{Xbp#Yq?hLiNE^K&gt;?0+9^PB&amp;ldCmUa|HTUb|9yUDFZ%Pj{OkETJ%8J0|Mz(&=
lt;
z|NVd9h5x`X)j#oX&lt;G+)KZq)Did49{k!vFHDH|_KPDW60Z-T1%1&gt;CJre|0|J1m;B@X
z_CIjK-_6hL!zTVs{yVvK&lt;Nt!s^E3Y@gN?}kmuz~|{u;s^FvZs&lt;AS-_SvtA_S|C*ou
ZTT}i=3D{D&amp;k)RFdVR_{aB)1sEzA7yy@wl!E{O

literal 0
HcmV?d00001

diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/=
meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
index f38606f2..bd885e06 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
@@ -1,6 +1,6 @@
-PR:append =3D ".arago7"
+PR:append =3D ".arago8"
=20
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}/${MACHINE}:${THISDIR}/${P=
N}:"
=20
 SRC_URI:append =3D " \
     <a class=3D"moz-txt-link-freetext" href=3D"file://local.rules">file:=
//local.rules</a> \
@@ -14,6 +14,26 @@ SRC_URI:append =3D " \
     <a class=3D"moz-txt-link-freetext" href=3D"file://timesyncd.conf">fi=
le://timesyncd.conf</a> \
 "
=20
+SRC_URI:append:j7200-evm =3D " \
+    <a class=3D"moz-txt-link-freetext" href=3D"file://mcan-links.tar.gz"=
>file://mcan-links.tar.gz</a> \
+"
+
+SRC_URI:append:j721e-evm =3D " \
+    <a class=3D"moz-txt-link-freetext" href=3D"file://mcan-links.tar.gz"=
>file://mcan-links.tar.gz</a> \
+"
+
+SRC_URI:append:j721s2-evm =3D " \
+    <a class=3D"moz-txt-link-freetext" href=3D"file://mcan-links.tar.gz"=
>file://mcan-links.tar.gz</a> \
+"
+
+SRC_URI:append:j784s4-evm =3D " \
+    <a class=3D"moz-txt-link-freetext" href=3D"file://mcan-links.tar.gz"=
>file://mcan-links.tar.gz</a> \
+"
+
+SRC_URI:append:j722s-evm =3D " \
+    <a class=3D"moz-txt-link-freetext" href=3D"file://mcan-links.tar.gz"=
>file://mcan-links.tar.gz</a> \
+"
+
</pre>
    </blockquote>
    <p>Hmm.. Is it better to explicitly add all the link files one by
      one? I was trying to not have the recipe too cluttered but maybe
      it's better to have the individual files here instead of the
      tarball?<br>
      I can resend if people agree.<br>
    </p>
    <p>Regards,</p>
    <p>Aniket<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:17AFF8B8425DEAB5.1968@lists.yoctoproject.org">
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word"> do_install:append() {
     install -d ${D}${sysconfdir}/udev/rules.d/
     install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.=
d/
@@ -43,3 +63,29 @@ do_install:append() {
     install -d ${D}${sysconfdir}/systemd/
     install -m 0644 ${WORKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/
 }
+
+do_install:append:j7200-evm() {
+    install -d ${D}${sysconfdir}/systemd/network/
+    install -m 0644 ${WORKDIR}/49-mcan*.link ${D}${sysconfdir}/systemd/n=
etwork/
+}
+
+do_install:append:j721e-evm() {
+    install -d ${D}${sysconfdir}/systemd/network/
+    install -m 0644 ${WORKDIR}/49-mcan*.link ${D}${sysconfdir}/systemd/n=
etwork/
+}
+
+do_install:append:j721s2-evm() {
+    install -d ${D}${sysconfdir}/systemd/network/
+    install -m 0644 ${WORKDIR}/49-mcan*.link ${D}${sysconfdir}/systemd/n=
etwork/
+}
+
+do_install:append:j784s4-evm() {
+    install -d ${D}${sysconfdir}/systemd/network/
+    install -m 0644 ${WORKDIR}/49-mcan*.link ${D}${sysconfdir}/systemd/n=
etwork/
+}
+
+do_install:append:j722s-evm() {
+    install -d ${D}${sysconfdir}/systemd/network/
+    install -m 0644 ${WORKDIR}/49-mcan*.link ${D}${sysconfdir}/systemd/n=
etwork/
+}
+
--=20
2.34.1



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#15104): <a
href=3D"https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta=
-arago/message/15104__;!!G3vK!V3qGKp5og0vb6WAjob_9PGqNUM5ApySsf5EZn71g_v8=
hFCwQ5iqyYi-ytCxLsTGuaKUCnRuSGgKvq2VoGjGYzQ7ROq1-VTl_Cw$"
      moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://ur=
ldefense.com/v3/__https://lists.yoctoproject.org/g/meta-arago/message/151=
04__;!!G3vK!V3qGKp5og0vb6WAjob_9PGqNUM5ApySsf5EZn71g_v8hFCwQ5iqyYi-ytCxLs=
TGuaKUCnRuSGgKvq2VoGjGYzQ7ROq1-VTl_Cw$</a>
Mute This Topic: <a
href=3D"https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/104=
115039/6607860__;!!G3vK!V3qGKp5og0vb6WAjob_9PGqNUM5ApySsf5EZn71g_v8hFCwQ5=
iqyYi-ytCxLsTGuaKUCnRuSGgKvq2VoGjGYzQ7ROq2aSTXLqQ$"
      moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://ur=
ldefense.com/v3/__https://lists.yoctoproject.org/mt/104115039/6607860__;!=
!G3vK!V3qGKp5og0vb6WAjob_9PGqNUM5ApySsf5EZn71g_v8hFCwQ5iqyYi-ytCxLsTGuaKU=
CnRuSGgKvq2VoGjGYzQ7ROq2aSTXLqQ$</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:meta-ar=
ago+owner@lists.yoctoproject.org">meta-arago+owner@lists.yoctoproject.org=
</a>
Unsubscribe: <a
href=3D"https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta=
-arago/unsub__;!!G3vK!V3qGKp5og0vb6WAjob_9PGqNUM5ApySsf5EZn71g_v8hFCwQ5iq=
yYi-ytCxLsTGuaKUCnRuSGgKvq2VoGjGYzQ7ROq0fgBNmLQ$"
      moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://ur=
ldefense.com/v3/__https://lists.yoctoproject.org/g/meta-arago/unsub__;!!G=
3vK!V3qGKp5og0vb6WAjob_9PGqNUM5ApySsf5EZn71g_v8hFCwQ5iqyYi-ytCxLsTGuaKUCn=
RuSGgKvq2VoGjGYzQ7ROq0fgBNmLQ$</a> [<a class=3D"moz-txt-link-abbreviated"=
 href=3D"mailto:a-limaye@ti.com">a-limaye@ti.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


</pre>
    </blockquote>
  </body>
</html>

--------------aKuaQmI77ulvNm0lVUCQyw4B--

