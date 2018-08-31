Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id D700C529AE
	for <meta-arago@arago-project.org>;
	Fri, 31 Aug 2018 18:54:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7VIsTGq095957
	for <meta-arago@arago-project.org>; Fri, 31 Aug 2018 13:54:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535741669;
	bh=mFoFDWeQ+xZfG5MfBo+HxXy+MpxYfl9baa1D/1WpmCk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=K2CM/LX8yjKrg+GUElpPKc3DxM6IUp2rfBrq29dF0auVsw81KCYPs2W2oE4TBn8XW
	Cfpgdf28qphOSICwdra/BePsfYuopPZVbHy8WKkMp9BhN/FWqMGSHHZSoW0v0q3g1G
	kCLVJ2kcODggJsM1f0396LgQx6C7d4mX7FHO+gZU=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7VIsTkM012334
	for <meta-arago@arago-project.org>; Fri, 31 Aug 2018 13:54:29 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 31 Aug 2018 13:54:29 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 31 Aug 2018 13:54:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7VIsTMG022471;
	Fri, 31 Aug 2018 13:54:29 -0500
Date: Fri, 31 Aug 2018 14:52:50 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Qin Su <qsu@ti.com>
Message-ID: <20180831185250.GA2362@beryl>
References: <1535741433-30388-1-git-send-email-qsu@ti.com>
	<1535741433-30388-2-git-send-email-qsu@ti.com>
MIME-Version: 1.0
In-Reply-To: <1535741433-30388-2-git-send-email-qsu@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v3 1/3] armnn-caffe: caffe protobuf files used in building caffe models in armnn.
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
X-List-Received-Date: Fri, 31 Aug 2018 18:54:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 31, 2018 at 02:50:31PM -0400, Qin Su wrote:
> Caffe protobuf files built with protobuf version 3.2.0 and used in
> building caffe network models in armnn.
> 
> Signed-off-by: Qin Su <qsu@ti.com>
> ---
>  .../recipes-support/armnn-caffe/armnn-caffe.bb         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe.bb
> 
> diff --git a/meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe.bb b/meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe.bb
> new file mode 100644
> index 0000000..6234474
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "Caffe protobuf files - used in ARMNN for Caffe network models"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://README.md;md5=01b8fd7c1b9506378a45200f64d6e0d7"
> +
> +SRC_URI = " \
> +    git://git@bitbucket.itg.ti.com/processor-sdk/tidl-utils.git;protocol=ssh; \

NAK.


> +"
> +
> +SRCREV = "9ae62427ad233597bf345e9572c252eedf8cc2b3"
> +
> +S = "${WORKDIR}/git"
> +
> +do_install() {
> +        install -d ${D}${datadir}/${PN}/caffe/proto/
> +	cp ${S}/caffeImport/* ${D}${datadir}/${PN}/caffe/proto/.
> +}
> +
> +
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

