Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id C9ACB52975
	for <meta-arago@arago-project.org>;
	Tue,  6 Mar 2018 18:23:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w26INC22024195
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 12:23:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520360592;
	bh=UHKqx4L5rTfF+yKhAfqH2hfs8kv9gbCuQKp+Y02sq9I=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=rJzpIndMHVG+UOr7WkN0dRlqiWnJqw40nJGuguUV9naQoqxUKqHHs0tAAS3J9E58v
	NQA4nbxVLKrOJ5SNw1won76fJ34U7OEfe1zbEBrrW9izi1ngit3Des2RYbBITG+lGS
	ooA//cbCI3zy9r0XAsh3RJ4+7saHeMZVvvXyR5Jg=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26INCNL005014
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 12:23:12 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 6 Mar 2018 12:23:11 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 6 Mar 2018 12:23:11 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26INB7k003631;
	Tue, 6 Mar 2018 12:23:11 -0600
To: Stephen Molfetta <sjmolfetta@ti.com>, <meta-arago@arago-project.org>
References: <1520356764-17285-1-git-send-email-sjmolfetta@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <a16b7b7e-3f03-cc16-1d38-329d9e7e88cc@ti.com>
Date: Tue, 6 Mar 2018 13:23:11 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1520356764-17285-1-git-send-email-sjmolfetta@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk][master][PATCH] dra7xx: pdk: updating build install step
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
X-List-Received-Date: Tue, 06 Mar 2018 18:24:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Does this require a commit ID bump?


On 3/6/2018 12:19 PM, Stephen Molfetta wrote:
> DRA7xx PDK introduced a new build-related file and needs to install
> this file into the package location
> ---
>   recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> index b028e8c..3e8157d 100644
> --- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> +++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de
>   require recipes-ti/includes/ti-paths.inc
>   
>   PV = "01.00.00.08"
> -PR = "r0"
> +PR = "r1"
>   
>   PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
>   PDK_BUILD_GIT_PROTOCOL = "git"
> @@ -153,6 +153,7 @@ do_install_append_am57xx-hs-evm() {
>   }
>   
>   do_install_append_dra7xx() {
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/dra7xx
>       install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
>       install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda3xx
>       install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
> @@ -165,6 +166,7 @@ do_install_append_dra7xx() {
>       install -m 0755 makerules/rules_arp32.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
>       install -m 0755 makerules/rules_ti_cgt_arm.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
>   
> +    install -m 0755 dra7xx/linkcmd.xdt ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/dra7xx
>       install -m 0755 tda2xx/config_tda2xx.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
>       install -m 0755 tda2xx/config_tda2xx_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
>       install -m 0755 tda2xx/config_tda2xx_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
> @@ -175,7 +177,6 @@ do_install_append_dra7xx() {
>       install -m 0755 tda2ex/config_tda2ex_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
>       install -m 0755 tda2ex/config_tda2ex_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
>       install -m 0755 tda2ex/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
> -
>   }
>   
>   do_install_append_keystone() {


