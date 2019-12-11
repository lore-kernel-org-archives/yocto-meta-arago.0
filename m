Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 482D1529BC
	for <meta-arago@arago-project.org>;
	Wed, 11 Dec 2019 18:06:47 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBBI5C8J117451
	for <meta-arago@arago-project.org>; Wed, 11 Dec 2019 12:05:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576087512;
	bh=3m5TithqCbCZgf2f40VarQ5cyF7SPWF8IyjDqlmPa9A=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=MH8qV5iH9yaPNIosg2HQ8+GNWN2ap61dXtd7hMr5oVkJH+D5RsbpDPobKYVSiOHIM
	7FNnNDYFqQ1WpN54zjg5HPkG2GYPbhVgVa3wkFIuHXaYue5MK8r4VsClD5bCb2j22Y
	mA3iSFPWnc1UNPxA+230XwJYxnAOdr2oeQ2uUsk0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBBI5CvQ098630
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 11 Dec 2019 12:05:12 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 11 Dec 2019 12:05:12 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 11 Dec 2019 12:05:12 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBBI5CNr009267;
	Wed, 11 Dec 2019 12:05:12 -0600
To: Denys Dmytriyenko <denys@ti.com>, <meta-arago@arago-project.org>
References: <1576005284-14624-1-git-send-email-denys@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <26b6ace3-8e4c-444e-10ca-15c45ba25fe5@ti.com>
Date: Wed, 11 Dec 2019 13:05:11 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1576005284-14624-1-git-send-email-denys@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [EXTERNAL] [tisdk-setup-scripts][PATCH] setup-uboot-env-am65x: pass console to u-boot bootargs for NFS boot
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
X-List-Received-Date: Wed, 11 Dec 2019 18:06:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Pushed to master.


Thank you,

Jake

On 12/10/2019 2:14 PM, Denys Dmytriyenko wrote:
> U-boot default bootargs was missing console setting, resulting in duplicate
> kernel logs.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Suggested-by: Andreas Dannenberg <dannenberg@ti.com>
> ---
>   setup-uboot-env-am65x.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/setup-uboot-env-am65x.sh b/setup-uboot-env-am65x.sh
> index e17f700..b6e043b 100644
> --- a/setup-uboot-env-am65x.sh
> +++ b/setup-uboot-env-am65x.sh
> @@ -152,7 +152,7 @@ do_expect "\"$prompt\"" "send \"setenv name_kern $kernelimage\"" $cwd/setupBoard
>   do_expect "\"$prompt\"" "send \"setenv bootcmd 'run findfdt; run envboot; run setup_\${kern_boot}; run init_\${rootfs_boot}; run get_kern_\${kern_boot}; run get_fdt_\${kern_boot}; run get_overlay_\${kern_boot}; run run_kern'\"" $cwd/setupBoard.minicom
>   
>   do_expect "\"$prompt\"" "send \"setenv init_net 'run args_all args_net; setenv autoload no; dhcp'\"" $cwd/setupBoard.minicom
> -do_expect "\"$prompt\"" "send \"setenv args_net 'setenv bootargs \${optargs} rootfstype=nfs root=/dev/nfs rw nfsroot=\${serverip}:\${nfs_root},\${nfs_options} ip=dhcp'\"" $cwd/setupBoard.minicom
> +do_expect "\"$prompt\"" "send \"setenv args_net 'setenv bootargs console=\${console} \${optargs} rootfstype=nfs root=/dev/nfs rw nfsroot=\${serverip}:\${nfs_root},\${nfs_options} ip=dhcp'\"" $cwd/setupBoard.minicom
>   do_expect "\"$prompt\"" "send \"setenv get_kern_net 'tftp \${loadaddr} \${name_kern}'\"" $cwd/setupBoard.minicom
>   do_expect "\"$prompt\"" "send \"setenv get_fdt_net 'tftp \${fdtaddr} \${name_fdt}'\"" $cwd/setupBoard.minicom
>   do_expect "\"$prompt\"" "send \"setenv get_overlay_net 'fdt address \${fdtaddr};fdt resize 0x100000;for overlay in \${overlay_files};do;tftp \${overlayaddr} \${overlay};fdt apply \${overlayaddr}; done'\"" $cwd/setupBoard.minicom

