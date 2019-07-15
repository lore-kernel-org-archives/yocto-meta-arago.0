Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 5D416520E1
	for <meta-arago@arago-project.org>;
	Mon, 15 Jul 2019 19:54:03 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6FJrEli026417
	for <meta-arago@arago-project.org>; Mon, 15 Jul 2019 14:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563220394;
	bh=wk0dcwVcJhBlje1wpa2Xpi3r6JCLXOB7hUaXHIryDMY=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=snbBCJ2nV60eF60MCUI0AtHA0sGx1pnMkiWD5njY37kkkt7f2/ZZQcJ0j2j3Hw99o
	obcP47gWzhP+Elu8sHo3nYoFZb9r/HX82SJSH3fW1wjL78J7+DifQSPFSg2oLQcjs4
	0pHzcybfCFnoU/H74G6WsFKFDePvr9tl/VX0PTSg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6FJrEFO047127
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 15 Jul 2019 14:53:14 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 15 Jul 2019 14:53:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 15 Jul 2019 14:53:13 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6FJrDJ1026916;
	Mon, 15 Jul 2019 14:53:13 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1563217177-9111-1-git-send-email-j-stiffler@ti.com>
	<20190715194420.GF9038@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <431d6799-f6f0-e976-c4fb-570a8a985a4b@ti.com>
Date: Mon, 15 Jul 2019 15:53:13 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190715194420.GF9038@beryl>
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
X-List-Received-Date: Mon, 15 Jul 2019 19:54:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 7/15/2019 3:44 PM, Denys Dmytriyenko wrote:
> On Mon, Jul 15, 2019 at 02:59:36PM -0400, Jacob Stiffler wrote:
>> From: Yimin Zhang <a0216607@ti.com>
>>
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   .../recipes-support/kaldi/kaldi_git.bb             | 47 ++++++++++++++++++++++
>>   1 file changed, 47 insertions(+)
>>   create mode 100644 meta-arago-extras/recipes-support/kaldi/kaldi_git.bb
>>
>> diff --git a/meta-arago-extras/recipes-support/kaldi/kaldi_git.bb b/meta-arago-extras/recipes-support/kaldi/kaldi_git.bb
>> new file mode 100644
>> index 0000000..6937696
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-support/kaldi/kaldi_git.bb
>> @@ -0,0 +1,47 @@
>> +SUMMARY = "TI KALDI speech recognition toolkit"
>> +HOMEPAGE = "http://kaldi-asr.org"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=35439d742a3df991e4f4f0e68e2d634c"
>> +
>> +PR = "r0"
>> +COMPATIBLE_MACHINE = "dra7xx"
>> +
>> +require recipes-ti/includes/arago-paths.inc
>> +
>> +SRC_URI = "git://git.ti.com/processor-sdk/kaldi.git;protocol=git;branch=${BRANCH}"
>> +BRANCH = "kaldi_1-0-0"
>> +SRCREV = "a472be2e2f8598a3e360bc7ca87ff4f73afa2d9e"
>> +
>> +DEPENDS = " \
>> +	linalg \
>> +	openfst \
>> +"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +export LINALG_DIR  = "${LINALG_INSTALL_DIR}"
>> +export OPENFST_DIR = "${STAGING_DIR_TARGET}${prefix}"
>> +export TARGET_ROOTDIR="${STAGING_DIR_TARGET}"
>> +
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +EXTRA_OECONF += "--static --use-cuda=no --mathlib=CLAPACK --clapack-root=${LINALG_INSTALL_DIR}/packages/ti/linalg --fst-root=${STAGING_DIR_TARGET}${prefix} --fst-version=1.6.2 --ti-cross-compile --ti-device=AM57"
>> +
>> +EXTRA_OEMAKE = "-C src"
>> +
>> +do_configure() {
>> +	cd src
>> +	chmod +x configure
>> +	./configure ${EXTRA_OECONF}
> Any specific reason to not inherit autotools and/or calling oe_runconf?


I was seeing some problem where is was trying to invoke "../configure" 
instead of "./configure".  I never completely understood what was 
causing this, so I can look into it more if you'd like.


>
>> +}
>> +
>> +do_compile() {
>> +	oe_runmake online2bin featbin
>> +}
>> +
>> +do_install() {
>> +	chmod +x export_kaldi.sh
>> +	./export_kaldi.sh --nnet2-online . ${D}${datadir}/ti/examples/kaldi
>> +}
>> +
>> +# to create a package for KALDI
>> +FILES_${PN} += "${datadir}/ti/examples/kaldi"
>> -- 
>> 2.7.4
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

