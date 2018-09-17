Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 40D27529CA
	for <meta-arago@arago-project.org>;
	Mon, 17 Sep 2018 13:51:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8HDphoJ024304
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 08:51:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537192303;
	bh=WBnQyDrOO4y4Xt/GWfizIsSQknQeGvZnEMYPcN4754E=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=BP50Lm7fScpDixDmKSTyyXjCBL/ZXOJJdivPypPo+zrsbp8arYwvtU8wVGZv6f8H5
	Nt6uzrx8vBI7WE4WuTx7Rlfyz3EqRRv+XlSAUoVQaIMfLK5x2cvLVzj/85m2ZMXP4i
	Mm9/7fdJjBlTms6GkIfG/eKaZmTYBtgn91gDuWc4=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HDph8h012341
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 08:51:43 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 17 Sep 2018 08:51:43 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 17 Sep 2018 08:51:43 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HDpg5o018234
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 08:51:42 -0500
To: <meta-arago@arago-project.org>
References: <1536861387-7418-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <17578a1a-385b-f1a7-9742-37f3a5e0aa10@ti.com>
Date: Mon, 17 Sep 2018 09:51:42 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1536861387-7418-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [rocko/master][PATCH v6 0/5] Add ARMNN
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
X-List-Received-Date: Mon, 17 Sep 2018 13:51:51 -0000
Content-Type: multipart/alternative;
	boundary="------------C0E2B4F74E391B3681C94D11"
Content-Language: en-US

--------------C0E2B4F74E391B3681C94D11
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

Can you please backport this set to ti2018.03?


Thank you,

Jake


On 9/13/2018 1:56 PM, Jacob Stiffler wrote:
> Add ARMNN and required dependencies.
>
> Qin Su (5):
>    stb: C/C++ libraries used to build armnn test examples.
>    arm-compute-library: Machine Learning library for ARM.
>    armnn-caffe: caffe protobuf files used in building caffe models in
>      armnn.
>    armnn-tensorflow: tensorflow protobuf files for building tensorflow
>      models in armnn
>    armnn: ARM NN machine learning SDK.
>
>   .../arm-compute-library/arm-compute-library_git.bb | 44 +++++++++++++++++
>   .../recipes-support/armnn-caffe/armnn-caffe_git.bb | 22 +++++++++
>   .../armnn-tensorflow/armnn-tensorflow_git.bb       | 25 ++++++++++
>   .../armnn/0001-stdlib-issue-work-around.patch      | 55 ++++++++++++++++++++++
>   .../0002-enable-use-of-boost-shared-library.patch  | 33 +++++++++++++
>   .../recipes-support/armnn/armnn_git.bb             | 45 ++++++++++++++++++
>   meta-arago-extras/recipes-support/stb/stb_git.bb   | 22 +++++++++
>   7 files changed, 246 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
>   create mode 100644 meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe_git.bb
>   create mode 100644 meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow_git.bb
>   create mode 100755 meta-arago-extras/recipes-support/armnn/armnn/0001-stdlib-issue-work-around.patch
>   create mode 100755 meta-arago-extras/recipes-support/armnn/armnn/0002-enable-use-of-boost-shared-library.patch
>   create mode 100644 meta-arago-extras/recipes-support/armnn/armnn_git.bb
>   create mode 100644 meta-arago-extras/recipes-support/stb/stb_git.bb
>


--------------C0E2B4F74E391B3681C94D11
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre class="content">Denys,

Can you please backport this set to ti2018.03?


Thank you,

Jake</pre>
    <br>
    <div class="moz-cite-prefix">On 9/13/2018 1:56 PM, Jacob Stiffler
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1536861387-7418-1-git-send-email-j-stiffler@ti.com">
      <pre wrap="">Add ARMNN and required dependencies.

Qin Su (5):
  stb: C/C++ libraries used to build armnn test examples.
  arm-compute-library: Machine Learning library for ARM.
  armnn-caffe: caffe protobuf files used in building caffe models in
    armnn.
  armnn-tensorflow: tensorflow protobuf files for building tensorflow
    models in armnn
  armnn: ARM NN machine learning SDK.

 .../arm-compute-library/arm-compute-library_git.bb | 44 +++++++++++++++++
 .../recipes-support/armnn-caffe/armnn-caffe_git.bb | 22 +++++++++
 .../armnn-tensorflow/armnn-tensorflow_git.bb       | 25 ++++++++++
 .../armnn/0001-stdlib-issue-work-around.patch      | 55 ++++++++++++++++++++++
 .../0002-enable-use-of-boost-shared-library.patch  | 33 +++++++++++++
 .../recipes-support/armnn/armnn_git.bb             | 45 ++++++++++++++++++
 meta-arago-extras/recipes-support/stb/stb_git.bb   | 22 +++++++++
 7 files changed, 246 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
 create mode 100644 meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe_git.bb
 create mode 100644 meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow_git.bb
 create mode 100755 meta-arago-extras/recipes-support/armnn/armnn/0001-stdlib-issue-work-around.patch
 create mode 100755 meta-arago-extras/recipes-support/armnn/armnn/0002-enable-use-of-boost-shared-library.patch
 create mode 100644 meta-arago-extras/recipes-support/armnn/armnn_git.bb
 create mode 100644 meta-arago-extras/recipes-support/stb/stb_git.bb

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------C0E2B4F74E391B3681C94D11--
