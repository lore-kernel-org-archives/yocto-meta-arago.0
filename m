Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id E6F5752993
	for <meta-arago@arago-project.org>;
	Thu, 13 Sep 2018 18:41:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DIflFf124180
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 13:41:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536864107;
	bh=Y4FDvtCvwfFoxI6YPkSwYVOplqhMsmtbh7naL2areWY=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=PXlKn7frf1vV4yPs3nKXEk1n4l5E2MK6w7yYar4U4743CZEpMfWGchjiiw1i6TewM
	U+WhZ69+s3GBbDL5s/z8gOV/Jxn9FMglXM2yjRZaLCCcFSspfURGzlfo+paLmOX4FF
	UXPcUj+Dcn8SmMT0rSZXWqFMVULDH+ZbDLxFIH6Q=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DIflOg011243
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 13:41:47 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 13:41:47 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 13:41:46 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DIfk5j006639;
	Thu, 13 Sep 2018 13:41:47 -0500
To: <meta-arago@arago-project.org>
References: <1536861387-7418-1-git-send-email-j-stiffler@ti.com>
	<1536861387-7418-4-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <f588648d-1fd5-bc53-f271-70f666e51297@ti.com>
Date: Thu, 13 Sep 2018 14:41:47 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1536861387-7418-4-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [rocko/master][PATCH v6 3/5] armnn-caffe: caffe protobuf files used in building caffe models in armnn.
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
X-List-Received-Date: Thu, 13 Sep 2018 18:41:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

The LIC_CHKSUM_FILE is invalid. I missed updating the path to the new file.

I will send a new version once I double check with a clean build.


- Jake


On 9/13/2018 1:56 PM, Jacob Stiffler wrote:
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
> * For installation, use install by looping over files.
> * Update license information.
>    - Use BSD-2-Clause license from caffee sources which were used to
>      generate these files.
>
>   .../recipes-support/armnn-caffe/armnn-caffe_git.bb | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe_git.bb
>
> diff --git a/meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe_git.bb b/meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe_git.bb
> new file mode 100644
> index 0000000..054552e
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe_git.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Caffe protobuf files - used in ARMNN for Caffe network models"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=91d560803ea3d191c457b12834553991"
> +
> +SRC_URI = " \
> +    git://git.ti.com/tidl/tidl-utils;branch=${BRANCH} \
> +"
> +
> +PV = "1.0"
> +
> +BRANCH = "master"
> +SRCREV = "16030b2e43de6143f371072d54760737ddda0645"
> +
> +S = "${WORKDIR}/git"
> +
> +do_install() {
> +        install -d ${D}${datadir}/${BPN}/caffe/proto/
> +        for file in ${S}/caffeImport/*
> +        do
> +            install -m 0644 $file ${D}${datadir}/${BPN}/caffe/proto/
> +        done
> +}


