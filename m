Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 35B5D5203A
	for <meta-arago@arago-project.org>;
	Wed, 12 Apr 2017 05:43:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3C5hNRR016981
	for <meta-arago@arago-project.org>; Wed, 12 Apr 2017 00:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1491975803;
	bh=+a1EufD+9FgHJD3Nz+C411tSun57asKMI4wIUQrcDmc=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=p4rgC0v6/Rr3c32natm+4M+lQsPRKf73A+4awGATdCynFnTJJRKJU6wi/+auDBXKr
	hwyZXieWmdJ/mneufv4m3kMInH6xo5kYiKyuNCkom7ld1Lf+K78WItN+QYw+h1Hjgu
	JFVIFcSU1UtcJduJlTj+NGnbS9lnHS7M1vXKSKe4=
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3C5hMAi024981
	for <meta-arago@arago-project.org>; Wed, 12 Apr 2017 00:43:22 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3C5hJAO023020
	for <meta-arago@arago-project.org>; Wed, 12 Apr 2017 11:13:20 +0530
Received: from [172.24.159.169] (172.24.159.169) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Apr 2017 11:13:18 +0530
To: Jacob Stiffler <j-stiffler@ti.com>, <meta-arago@arago-project.org>
References: <1491827109-1896-1-git-send-email-j-stiffler@ti.com>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <58EDBE76.2070801@ti.com>
Date: Wed, 12 Apr 2017 11:13:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1491827109-1896-1-git-send-email-j-stiffler@ti.com>
X-Originating-IP: [172.24.159.169]
Subject: Re: [morty/master][PATCH] external-linaro-toolchain: fix against upstream changes
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
X-List-Received-Date: Wed, 12 Apr 2017 05:43:23 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ACK.
I've verified that this resolves the problem.

On 10-Apr-17 5:55 PM, Jacob Stiffler wrote:
> * Recent upstream changes cause bindir and sbindir to be removed if
>    they are empty.
> * The bbappend in this layer assumes these directories exist.
> * This change removes that assumption.
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
> index 7648e36..e261259 100644
> --- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
> +++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
> @@ -133,6 +133,7 @@ do_install_append() {
>   	sed -i -e "s# /lib/# ../../lib/#g" -e "s# /usr/lib/# ./#g" ${D}${libdir}/libpthread.so
>   
>   	if [ -d ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/libc/${bindir} ]; then
> +		install -d ${D}${bindir}
>   		cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/libc/${bindir}/* ${D}${bindir}
>   	fi
>   
> @@ -161,5 +162,4 @@ do_install_append() {
>   	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'rm -rf ${D}${includedir}/uapi/.install; rm -rf ${D}${includedir}/misc/.install; rm -rf ${D}${includedir}/misc/cxl.h; rm -rf ${D}${includedir}/scsi/.install; rm -rf ${D}${includedir}/scsi/scsi_netlink*; rm -rf ${D}${includedir}/scsi/scsi_bsg*; rm -rf ${D}${includedir}/scsi/cxlflash_ioctl.h; rm -rf ${D}${includedir}/scsi/fc; rm -rf ${D}${includedir}/xen', d)}
>   
>   	rm ${D}${base_libdir}/*.spec
> -	rmdir ${D}${sbindir}
>   }


