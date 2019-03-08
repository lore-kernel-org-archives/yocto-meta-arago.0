Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id A08E0529A4
	for <meta-arago@arago-project.org>;
	Fri,  8 Mar 2019 23:27:08 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x28NR04W075612
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 17:27:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552087620;
	bh=tym505hFIzjj+AMtxTo51GXlZOn/O6L8/ij0BacLZRY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ulK73bEjC7C1HFdvobqh3+dOjLVgTQbYObbJ2dZ+y+R1VaerZXkNrMwfFmjDWQ3Mv
	LtUcblE4MhSJSKYyDKuzigB8yP7r/+0B8useMaL8n3K0jk54eUzFKAdTp38Kms0QRf
	fctiJfDfqxLvwpWyRRgbGks5O1uwzEmVCfPIUFRk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x28NR0ap078910
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 17:27:00 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 8 Mar 2019 17:26:59 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 8 Mar 2019 17:26:59 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x28NQx61003890;
	Fri, 8 Mar 2019 17:26:59 -0600
Date: Fri, 8 Mar 2019 18:26:59 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <a0271529@ti.com>
Message-ID: <20190308232659.GF26510@beryl>
References: <1551895171-20664-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
In-Reply-To: <1551895171-20664-1-git-send-email-a0271529@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko/master] [PATCH 1/2] acontis-atemsys: build the kernel module for acontis EtherCAT master
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
X-List-Received-Date: Fri, 08 Mar 2019 23:27:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Mar 06, 2019 at 12:59:30PM -0500, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>  .../acontis-ethercat-demo/acontis-atemsys_3.0.1.28.bb  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-apps/acontis-ethercat-demo/acontis-atemsys_3.0.1.28.bb
> 
> diff --git a/meta-arago-extras/recipes-apps/acontis-ethercat-demo/acontis-atemsys_3.0.1.28.bb b/meta-arago-extras/recipes-apps/acontis-ethercat-demo/acontis-atemsys_3.0.1.28.bb
> new file mode 100644
> index 0000000..94e0c56
> --- /dev/null
> +++ b/meta-arago-extras/recipes-apps/acontis-ethercat-demo/acontis-atemsys_3.0.1.28.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "acontis atemsys kernel module for EtherCAT master"
> +HOMEPAGE = "https://www.acontis.com/en/ethercat-for-ti-processors.html"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=65dd37ccb3e888dc57e47d925b80b38a"
> +
> +SRC_URI = "https://www.acontis.com/files/support/ethercat/EC-Master-Atemsys-V${PV}-Linux.tar.gz;subdir=${P}"
> +SRC_URI[md5sum] = "d8d92ae671c5cf78ae22bc5386d7f44f"
> +SRC_URI[sha256sum] = "dd3d83eb984b17b8378e0a5e5dfae8c77e25c5428a26319f59f44f805aff9e89"
> +
> +COMPATIBLE_MACHINE = "am335x-evm|am57xx-evm"

Why is it so strict? Can it be used on non-EVM devices in AM335x and AM57x 
families?


> +PR = "r0"
> +
> +S = "${WORKDIR}/${P}/yocto/meta-acontis/recipes-kernel/atemsys/files"
> +
> +inherit module
> +
> +EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}"'
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

