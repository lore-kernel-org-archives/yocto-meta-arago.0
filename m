Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 13140529D3
	for <meta-arago@arago-project.org>;
	Fri, 20 Sep 2019 18:07:29 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KI6LLV026164
	for <meta-arago@arago-project.org>; Fri, 20 Sep 2019 13:06:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569002781;
	bh=x2mehFKpk1bUfAF7cCBdgVML+RF7cZoTSIEl7Y/6CUc=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=X7kMrGWdq40hwcJUyxa32IpnUG87u/uyYqAhjC/5PO26AF0J34avgL9MjG3qrbjOI
	q3p4SC1r8OXkNm0TQSIRt0q9Jars4WXoH7k49DBc/FyykiIi7nnpAG/E0aVcZ8nHOV
	UgW155sIfGldQgz/OXFpvTWuNrgXGVP78fPrSwQ8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KI6Lw2049821
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 20 Sep 2019 13:06:21 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 20 Sep 2019 13:06:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 20 Sep 2019 13:06:16 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KI6Kw6119129;
	Fri, 20 Sep 2019 13:06:20 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <20190918215213.12185-1-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <bbbdb85a-515e-159b-c1f3-ec49f49a8261@ti.com>
Date: Fri, 20 Sep 2019 14:06:16 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190918215213.12185-1-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [master/thud/ti2019.03 1/4] flatbuffers: add version 1.10.0
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
X-List-Received-Date: Fri, 20 Sep 2019 18:07:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport this set to ti2019.03.


Thank you,

Jake

On 9/18/2019 5:52 PM, Hongmei Gou wrote:
> * This is back ported from meta-openembedded master/warrior branch
> * This version is required for building armnn with TensorFlow Lite parser
>
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>   .../flatbuffers/flatbuffers_1.10.0.bb         | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb
>
> diff --git a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb
> new file mode 100644
> index 00000000..452e1e65
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb
> @@ -0,0 +1,34 @@
> +SUMMARY = "Memory Efficient Serialization Library"
> +HOMEPAGE = "https://github.com/google/flatbuffers"
> +SECTION = "console/tools"
> +LICENSE = "Apache-2.0"
> +
> +PACKAGE_BEFORE_PN = "${PN}-compiler"
> +
> +RDEPENDS_${PN}-compiler = "${PN}"
> +RDEPENDS_${PN}-dev += "${PN}-compiler"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a873c5645c184d51e0f9b34e1d7cf559"
> +
> +SRCREV = "c0698cc33f1e534bb59c455909b88cc2726089af"
> +
> +SRC_URI = "git://github.com/google/flatbuffers.git"
> +
> +# Make sure C++11 is used, required for example for GCC 4.9
> +CXXFLAGS += "-std=c++11"
> +BUILD_CXXFLAGS += "-std=c++11"
> +
> +# BUILD_TYPE=Release is required, otherwise flatc is not installed
> +EXTRA_OECMAKE += "\
> +    -DCMAKE_BUILD_TYPE=Release \
> +    -DFLATBUFFERS_BUILD_TESTS=OFF \
> +    -DFLATBUFFERS_BUILD_SHAREDLIB=ON \
> +"
> +
> +inherit cmake
> +
> +S = "${WORKDIR}/git"
> +
> +FILES_${PN}-compiler = "${bindir}"
> +
> +BBCLASSEXTEND = "native nativesdk"

