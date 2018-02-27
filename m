Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 3B3CE52975
	for <meta-arago@arago-project.org>;
	Tue, 27 Feb 2018 17:02:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1RH1ua3025389
	for <meta-arago@arago-project.org>; Tue, 27 Feb 2018 11:01:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519750916;
	bh=LorLkdDAKwYwzOiUiwJz9wn7kEvdHcRA0M4qwzmPt/s=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=ocdzIL1rD2kZ5GzXpnq7ZWsovtwPhEHOD+xS+hGS3GEyxsQn5563I3gkIAGKgEvHq
	Ek7D1AAOauzcXlaIdkmZN0BEPi+jbV+b2xZTeRlxyopswpCxcIAd0MkBqG032oHY0j
	tnwIqRbLF6aduEj9b2EV87LPuodEvtmPdrUBcmUw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1RH1uT6007389
	for <meta-arago@arago-project.org>; Tue, 27 Feb 2018 11:01:56 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 27 Feb 2018 11:01:55 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 27 Feb 2018 11:01:55 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1RH1tUD030411;
	Tue, 27 Feb 2018 11:01:55 -0600
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1519744457-3844-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <7b409bdd-9692-a70c-57b4-f510744356fa@ti.com>
Date: Tue, 27 Feb 2018 12:01:55 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1519744457-3844-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH v3] ti-pdk-build-rtos: Installing newly added comp_paths.mk
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
X-List-Received-Date: Tue, 27 Feb 2018 17:02:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Thank you. This has been pushed.


On 2/27/2018 10:14 AM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   v3 - Updated PV and added 'PACKAGE_ARCH = "${MACHINE_ARCH}
>   v2 - Updated the commit #
>   v1 - installing the newly added file
>
>   recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> index e1e8ccc..b028e8c 100644
> --- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> +++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> @@ -4,15 +4,15 @@ LIC_FILES_CHKSUM = "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de
>   
>   require recipes-ti/includes/ti-paths.inc
>   
> -PV = "01.00.00.07"
> +PV = "01.00.00.08"
>   PR = "r0"
>   
>   PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
>   PDK_BUILD_GIT_PROTOCOL = "git"
>   PDK_BUILD_GIT_BRANCH = "master"
>   
> -# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.07"
> -PDK_BUILD_SRCREV = "cbac264f08aa9cdc2cd533d1433ef57b922cccb5"
> +# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.08"
> +PDK_BUILD_SRCREV = "f68931ff82eb051fc026ae28b2555f3c581eb6b9"
>   
>   BRANCH = "${PDK_BUILD_GIT_BRANCH}"
>   SRC_URI = "${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRANCH}"
> @@ -20,6 +20,7 @@ SRC_URI = "${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRAN
>   SRCREV = "${PDK_BUILD_SRCREV}"
>   
>   COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   S = "${WORKDIR}/git/"
>   
> @@ -35,6 +36,7 @@ do_install() {
>   
>       install -m 0755 Rules.make ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
>       install -m 0755 comp_top.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
> +    install -m 0755 comp_paths.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
>   
>       install -m 0755 makerules/build_config.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
>       install -m 0755 makerules/common.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules


