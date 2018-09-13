Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 42F0052A9E
	for <meta-arago@arago-project.org>;
	Thu, 13 Sep 2018 19:35:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DJZW9d004246
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 14:35:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536867332;
	bh=+980zHJoxtfz1QQ8aWMfS4Y06X6CmXIWnAFwCNPrCnM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=XiY+AAWHnRiTRiR9gcSDvmQd9gvwERhFQBmWdsgRJ63hkroq6TAW7WMP4bPDe18k4
	nZ+BK9YHqjjDQOBV32PZPJqF+lypMHACgqEHEcrJBuYKKvCOOROVmofAj09ATGZCwA
	p6FZBd1cbAcRs3LzAhjny/AB/CmBtX0zNcP6tqNQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DJZW8n013203
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 14:35:32 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 14:35:32 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 14:35:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DJZVBl008585;
	Thu, 13 Sep 2018 14:35:31 -0500
Date: Thu, 13 Sep 2018 15:34:06 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180913193406.GN12296@beryl>
References: <1536861387-7418-1-git-send-email-j-stiffler@ti.com>
	<1536861387-7418-5-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1536861387-7418-5-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko/master][PATCH v6 4/5] armnn-tensorflow: tensorflow protobuf files for building tensorflow models in armnn
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
X-List-Received-Date: Thu, 13 Sep 2018 19:35:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 13, 2018 at 01:56:26PM -0400, Jacob Stiffler wrote:
> From: Qin Su <qsu@ti.com>
> 
> Signed-off-by: Qin Su <qsu@ti.com>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> Changes from previous versions:
> * Add "_git" suffix to recipe name.
> * Add version.
> * DESCRIPTION --> SUMMARY.
> * Add branch option for SRC_URI.
> * Add dependency on protobuf-native
> * Add Apache license version (Apache-2.0)
> 
>  .../armnn-tensorflow/armnn-tensorflow_git.bb       | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow_git.bb
> 
> diff --git a/meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow_git.bb b/meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow_git.bb
> new file mode 100644
> index 0000000..f85c6a8
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow_git.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "Tensorflow protobuf files - used in ARMNN for Tensorflow network models"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=01e86893010a1b87e69a213faa753ebd"
> +
> +SRC_URI = " \
> +    git://github.com/tensorflow/tensorflow.git;name=tensorflow; \
> +    git://github.com/ARM-software/armnn.git;name=armnn;subdir=${WORKDIR}/armnn;destsuffix=armnn \
> +"
> +
> +PV = "1.10.0"
> +
> +SRCREV_tensorflow = "aed8f42bafabf11c5d92ce4109a5e0408b31f9c5"
> +SRCREV_armnn = "4c7098bfeab1ffe1cdc77f6c15548d3e73274746"

Do you need to specify SRCREV_FORMAT here?


> +DEPENDS = "protobuf-native"
> +
> +S = "${WORKDIR}/git"
> +
> +do_install() {
> +    install -d ${D}${datadir}/${PN}
> +    ${WORKDIR}/armnn/scripts/generate_tensorflow_protobuf.sh ${D}${datadir}/${PN} ${STAGING_DIR_NATIVE}${prefix}
> +}
> +
> +PACKAGES =+ "${PN}-source"
> +FILES_${PN}-source = "${datadir}/${PN}"

Hmm, what are those files, what are these sources? Should there be some 
description about what is being the output of this packages and what and where 
that gets installed?


> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

