Return-Path: <yogeshs@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 383DA529F0
	for <meta-arago@arago-project.org>;
	Tue, 17 Aug 2021 13:28:03 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17HDSPxx127932;
	Tue, 17 Aug 2021 08:28:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1629206905;
	bh=Fwn1zRW6AUFt3uRhtUNRkwsY6oi/RbCnevst4m6MXRM=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=jv9nEByFdwpEwp4gReqTiQzaIc+FwPpbVZv2RzuZtDJ2m97vBGVJjCL24HRCaMP56
	RE30CISSbt4r5zcxtysw524dGbiEG2731e2y2BlkjmAYHDQ/sqk+muJVNBKCr5TNWN
	3CEv+5bE8/YsdZCo5VJ6d15f1OAcRepIEa24S7Jk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17HDSPTR043154
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Aug 2021 08:28:25 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 17 Aug 2021 08:28:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 17 Aug 2021 08:28:24 -0500
Received: from [10.250.39.223] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17HDSOvr083501;
	Tue, 17 Aug 2021 08:28:24 -0500
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@arago-project.org>
References: <1628820868-53610-1-git-send-email-denis@denix.org>
From: "Siraswar, Yogesh" <yogeshs@ti.com>
Message-ID: <4d401917-9f66-3e51-68b3-835307713cea@ti.com>
Date: Tue, 17 Aug 2021 08:28:24 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1628820868-53610-1-git-send-email-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [dunfell][PATCH v2] grub: fix do_configure() breakage with external-arm toolchain
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Aug 2021 13:28:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Applied to dunfell. Thanks

On 8/12/2021 9:14 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> grub and grub-efi break in do_configure() when using external-arm toolchain:
> 
> | checking for aarch64-poky-linux-objcopy... no
> | checking for objcopy... objcopy
> | checking for aarch64-poky-linux-strip... no
> | checking for strip... strip
> | checking for aarch64-poky-linux-nm... no
> | checking for nm... nm
> | checking for aarch64-poky-linux-ranlib... no
> | checking for ranlib... ranlib
> ...
> | checking whether objcopy works for absolute addresses... configure: error: objcopy cannot create binary files
> 
> That is due to external-arm toolchain's target triplet aarch64-none-linux-gnu
> being different from OE triplet like aarch64-poky-linux and configure script
> trying to use it to find binutils binaries like objcopy, falling back to host
> ones.
> 
> Help configure script to find correct objcopy and other binaries by passing
> the correct target triplet with --target parameter set to EAT_TARGET_SYS,
> overriding the default OE one.
> 
> Note: similar patch has been submitted upstream to meta-arm-toolchain:
> https://lists.yoctoproject.org/g/meta-arm/message/2163
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> Cc: Tom Rini <trini@konsulko.com>
> ---
> v2 - subject line in commit log got lost, fix it, no other changes
> 
>   meta-arago-distro/recipes-bsp/grub/grub%.bbappend | 9 +++++++++
>   1 file changed, 9 insertions(+)
>   create mode 100644 meta-arago-distro/recipes-bsp/grub/grub%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-bsp/grub/grub%.bbappend b/meta-arago-distro/recipes-bsp/grub/grub%.bbappend
> new file mode 100644
> index 0000000..1e5ea43
> --- /dev/null
> +++ b/meta-arago-distro/recipes-bsp/grub/grub%.bbappend
> @@ -0,0 +1,9 @@
> +# When external-arm toolchain is not in use, EAT_TARGET_SYS is undefined,
> +# causing below _append expansion to break - just weakly set it to empty
> +EAT_TARGET_SYS ?= ""
> +
> +# grub uses --target triplet to find binutils binaries such as objcopy
> +# Since external-arm toolchain uses aarch64-none-linux-gnu triplet,
> +# OE-defined TARGET_SYS differs from EAT_TARGET_SYS used by external-arm
> +# toolchain, grub needs passing the correct --target to configure script
> +CONFIGUREOPTS_append_class-target = "${@['',' --target=${EAT_TARGET_SYS}'][d.getVar('TCMODE') == 'external-arm']}"
> 

