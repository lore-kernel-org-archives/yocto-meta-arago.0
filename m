Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 777B6529D3
	for <meta-arago@arago-project.org>;
	Fri, 20 Sep 2019 18:06:18 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KI5AWP022567
	for <meta-arago@arago-project.org>; Fri, 20 Sep 2019 13:05:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569002710;
	bh=8TJ/mznX3t4ozEX1b+7GNeSMWE3k2ewHGKbh5xsazP0=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=u03Tr6ByY81YYco06OwcVWt2FRejAkWZvXLxk3YFfu6ELut2ILaGQkkHeahr7+qFK
	TjdiSoqYtC+STP7gZXRvD4zYfwtr1yblcPx5iw3FhHGeiciFxg6t6fuU9U+ug2aQQG
	q2e7m5u/Gbj9JwSXW//q8wu8M0+6spvxwpVdM050=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KI59Vu048080
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 20 Sep 2019 13:05:10 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 20 Sep 2019 13:05:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 20 Sep 2019 13:05:09 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KI59wB102088;
	Fri, 20 Sep 2019 13:05:09 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <20190822203126.4155-1-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <c42e7419-76ff-e3ee-cfe3-30291583099f@ti.com>
Date: Fri, 20 Sep 2019 14:05:05 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822203126.4155-1-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH v2 0/3] Add tensorflow-lite
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
X-List-Received-Date: Fri, 20 Sep 2019 18:06:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport these to ti2019.03.


Thank you,

Jake


On 8/22/2019 4:31 PM, Hongmei Gou wrote:
> This patch set starts from the baseline recipe at
> https://github.com/nnsuite/meta-neural-network/tree/master/recipes-tensorflow/tensorflow-lite,
>
> The major changes are listed below:
>
> 1. Made some cleanup for the baseline recipes, such as updating NEON2SSE and replacing AUTOREV
>
> 2. Installed minimal and benchmark_model binaries which have been built with the original Makefile
>
> 3. Patched Makefile to add label_image and installed the example binary and files
>     (model/image/labels.txt) needed to run the example
>
> v2 change:
> Keep the dependencies in the original single recipe, instead of creating separate recipes
> for all the dependencies
>
> Hongmei Gou (3):
>    tensorflow-lite: add version 1.12
>    tensorflow-lite: install minimal and benchmark_model examples, and all
>      .a files
>    tensorflow-lite: add label_image example and install the files to run
>      the example
>
>   ...001-Makefile-add-label_image-example.patch |  89 ++++++++++++
>   ...odification-for-tflite-1.12-to-eigen.patch |  13 ++
>   .../files/tensorflow-lite.pc.in               |   6 +
>   .../tensorflow-lite/tensorflow-lite_1.12.bb   | 136 ++++++++++++++++++
>   4 files changed, 244 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefile-add-label_image-example.patch
>   create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/files/apply-modification-for-tflite-1.12-to-eigen.patch
>   create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/files/tensorflow-lite.pc.in
>   create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
>

