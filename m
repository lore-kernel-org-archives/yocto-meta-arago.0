Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id F2A4D52995
	for <meta-arago@arago-project.org>;
	Tue, 16 Jul 2019 13:17:22 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6GDGW28053355
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2019 08:16:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563282992;
	bh=Len2pnuJFNpKTEwuYbpipxcUam6Ly1VcNxw2z2xIsfw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=CEqNBXheblId795zqjbOpfuCCZq7b/kuRBmM8vQKI745kKdqMzpor+Q0FKGoP9cJl
	m1YeMBXtH0wZq1i7kqNuDdbhvtoKLgbrxmorlin3OO45Rjx3nBGauuPGHYCoHdL06y
	LazhCWss9+DN/WkoIA0CKANxg6I9Qcwq0QoJ1TFo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6GDGWVb102551
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2019 08:16:32 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 16 Jul 2019 08:16:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 16 Jul 2019 08:16:32 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6GDGVDa108245;
	Tue, 16 Jul 2019 08:16:31 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1563217177-9111-1-git-send-email-j-stiffler@ti.com>
	<20190715194420.GF9038@beryl>
	<431d6799-f6f0-e976-c4fb-570a8a985a4b@ti.com>
	<20190715200517.GI9038@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <8f962f08-e98b-526c-af74-98c243873592@ti.com>
Date: Tue, 16 Jul 2019 09:16:31 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190715200517.GI9038@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/thud][PATCH 1/2] kaldi: add the kaldi speech recognition toolkit
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
X-List-Received-Date: Tue, 16 Jul 2019 13:17:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 7/15/2019 4:05 PM, Denys Dmytriyenko wrote:
> On Mon, Jul 15, 2019 at 03:53:13PM -0400, Jacob Stiffler wrote:
>> On 7/15/2019 3:44 PM, Denys Dmytriyenko wrote:
>>> On Mon, Jul 15, 2019 at 02:59:36PM -0400, Jacob Stiffler wrote:
>>>> From: Yimin Zhang <a0216607@ti.com>
>>>>
>>>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>>>> ---
>>>>   .../recipes-support/kaldi/kaldi_git.bb             | 47 ++++++++++++++++++++++
>>>>   1 file changed, 47 insertions(+)
>>>>   create mode 100644 meta-arago-extras/recipes-support/kaldi/kaldi_git.bb
>>>>
>>>> diff --git a/meta-arago-extras/recipes-support/kaldi/kaldi_git.bb b/meta-arago-extras/recipes-support/kaldi/kaldi_git.bb
>>>> new file mode 100644
>>>> index 0000000..6937696
>>>> --- /dev/null
>>>> +++ b/meta-arago-extras/recipes-support/kaldi/kaldi_git.bb
>>>> @@ -0,0 +1,47 @@
>>>> +SUMMARY = "TI KALDI speech recognition toolkit"
>>>> +HOMEPAGE = "http://kaldi-asr.org"
>>>> +LICENSE = "Apache-2.0"
>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=35439d742a3df991e4f4f0e68e2d634c"
>>>> +
>>>> +PR = "r0"
>>>> +COMPATIBLE_MACHINE = "dra7xx"
>>>> +
>>>> +require recipes-ti/includes/arago-paths.inc
>>>> +
>>>> +SRC_URI = "git://git.ti.com/processor-sdk/kaldi.git;protocol=git;branch=${BRANCH}"
>>>> +BRANCH = "kaldi_1-0-0"
>>>> +SRCREV = "a472be2e2f8598a3e360bc7ca87ff4f73afa2d9e"
>>>> +
>>>> +DEPENDS = " \
>>>> +	linalg \
>>>> +	openfst \
>>>> +"
>>>> +
>>>> +S = "${WORKDIR}/git"
>>>> +
>>>> +export LINALG_DIR  = "${LINALG_INSTALL_DIR}"
>>>> +export OPENFST_DIR = "${STAGING_DIR_TARGET}${prefix}"
>>>> +export TARGET_ROOTDIR="${STAGING_DIR_TARGET}"
>>>> +
>>>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>> +EXTRA_OECONF += "--static --use-cuda=no --mathlib=CLAPACK --clapack-root=${LINALG_INSTALL_DIR}/packages/ti/linalg --fst-root=${STAGING_DIR_TARGET}${prefix} --fst-version=1.6.2 --ti-cross-compile --ti-device=AM57"
>>>> +
>>>> +EXTRA_OEMAKE = "-C src"
>>>> +
>>>> +do_configure() {
>>>> +	cd src
>>>> +	chmod +x configure
>>>> +	./configure ${EXTRA_OECONF}
>>> Any specific reason to not inherit autotools and/or calling oe_runconf?
>>
>> I was seeing some problem where is was trying to invoke "../configure"
>> instead of "./configure".  I never completely understood what was causing
>> this, so I can look into it more if you'd like.
> Probably because configure is not in ${S}.


I made progress to get configure invoked using oe_runconf, but it 
appears that this configure is a bit non-standard. The options provided 
by CONFIGUREOPTS (e.g. --build, --host, --target) are not recognized, 
and cause an error. The options "--ti-cross-compile --ti-device=AM57" 
appear to have been implemented to enable cross-compilation.

So is it better to unset CONFIGUREOPTS and use oe_runconf, or directly 
invoke configure?


>
>>>> +}
>>>> +
>>>> +do_compile() {
>>>> +	oe_runmake online2bin featbin
>>>> +}
>>>> +
>>>> +do_install() {
>>>> +	chmod +x export_kaldi.sh
>>>> +	./export_kaldi.sh --nnet2-online . ${D}${datadir}/ti/examples/kaldi
>>>> +}
>>>> +
>>>> +# to create a package for KALDI
>>>> +FILES_${PN} += "${datadir}/ti/examples/kaldi"
>>>> -- 
>>>> 2.7.4
>>>>
>>>> _______________________________________________
>>>> meta-arago mailing list
>>>> meta-arago@arago-project.org
>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

