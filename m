Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 974C852A95
	for <meta-arago@arago-project.org>;
	Thu, 13 Sep 2018 18:21:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DILQ0x095360
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 13:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536862886;
	bh=2wmkssz60tAT1NPoVVfTz3VsZujv6ACXiIhH0XBdixA=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=CYrlnxwhBljG22VZAzDAjRBXToquQAyO3TlE2QBdaK/+Hub83wxMrB253xT/9KZZb
	dZPEKyTI5PaTDGvYFkfbQhQT4IsLCL9oQSauZgM5xrlKqG+ImBVR3j2gkrg0mY/p8h
	Kx1Spv5QXO6fd/nfBJUd24o1+TUIDqaWmfk6WCG4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DILQnd008176
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 13:21:26 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 13:21:26 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 13:21:26 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DILPeM020756;
	Thu, 13 Sep 2018 13:21:25 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1536861387-7418-1-git-send-email-j-stiffler@ti.com>
	<1536861387-7418-3-git-send-email-j-stiffler@ti.com>
	<20180913181239.GB12296@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <d5bb480e-d0a4-d442-68e6-444ab01c9187@ti.com>
Date: Thu, 13 Sep 2018 14:21:25 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180913181239.GB12296@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko/master][PATCH v6 2/5] arm-compute-library: Machine Learning library for ARM.
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
X-List-Received-Date: Thu, 13 Sep 2018 18:21:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/13/2018 2:12 PM, Denys Dmytriyenko wrote:
> On Thu, Sep 13, 2018 at 01:56:24PM -0400, Jacob Stiffler wrote:
>> From: Qin Su <qsu@ti.com>
>>
>> The ARM Computer Vision and Machine Learning library is a set of functions
>> optimised for both ARM CPUs and GPUs using SIMD technologies.
>>
>> Signed-off-by: Qin Su <qsu@ti.com>
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>> Changes from previous versions:
>> * Add "_git" suffix to recipe name.
>> * Add version.
>> * Add branch option for SRC_URI.
>> * For installation, use install by looping over libraries.
>> * Remove unnecessary checksums for SRC_URI.
>> * Set armv7a as COMPATIBLE_MACHINE as this is hardcoded in
>>    EXTRA_OESCONS.
> ^^^ Thanks a lot for all the fixes!
>
> BTW, is this recipe available in any other layer?

I did a quick search and could not find anything existing, but I did 
find a request for one on the github [1].

[1] https://github.com/ARM-software/ComputeLibrary/issues/512

>
>>   .../arm-compute-library/arm-compute-library_git.bb | 44 ++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>   create mode 100644 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
>>
>> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
>> new file mode 100644
>> index 0000000..23e31cd
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
>> @@ -0,0 +1,44 @@
>> +DESCRIPTION = "The ARM Computer Vision and Machine Learning library is a set of functions optimised for both ARM CPUs and GPUs."
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c93841b20cd522af621cabaea3aef8"
>> +
>> +COMPATIBLE_MACHINE = "armv7a"
>> +
>> +SRC_URI = " \
>> +    git://github.com/ARM-software/ComputeLibrary.git;branch=${BRANCH} \
>> +"
>> +
>> +PV  = "18.05"
>> +
>> +BRANCH = "master"
>> +SRCREV = "e2542c9f35ca427286822cd0c9296f49914f78b0"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +do_compile_prepend() {
>> +    unset CC CXX
>> +}
>> +
>> +inherit scons
>> +
>> +EXTRA_OESCONS = "arch=armv7a extra_cxx_flags="-fPIC" benchmark_tests=1 validation_tests=0 neon=1 openmp=1 opencl=0"
>> +
>> +LIBS += "-larmpl_lp64_mp"
>> +
>> +do_install() {
>> +    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
>> +
>> +    install -d ${D}${libdir}
>> +    for lib in ${S}/build/*.so
>> +    do
>> +        install -m 0644 $lib ${D}${libdir}
>> +    done
>> +
>> +    install -d ${D}${datadir}/${PN}
>> +    cp $CP_ARGS ${S}/. ${D}${datadir}/${PN}
>> +}
>> +
>> +INSANE_SKIP_${PN}-dev = "dev-elf"
>> +
>> +PACKAGES =+ "${PN}-source"
>> +FILES_${PN}-source = "${datadir}/${PN}"
>> -- 
>> 2.7.4
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


