Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id B779852970
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 19:37:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JJaFEN009523
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 14:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521488175;
	bh=buK8Le09JjFdHCLv5rPBf2Fi9d8AVsy4W0N8lgh9ZVw=;
	h=Subject:From:To:References:Date:In-Reply-To;
	b=wwSPIMb6D682VvNJbXtpqFn3iG+0taOR9AK7E2nVkqfDHeU5jhQKFOE/JEpDYaSAn
	ofog3f8HVt4bJpmxmk+hU9w+Gn/rqKktyXZxO0W/rKvk977/6bg7nto8wY7Q2Tll0V
	T5fDz5kIKQ87I8JKBw7lPpKhXQC6frU2LPD63wTk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JJaEQv005032
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 14:36:14 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 14:36:14 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 14:36:14 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JJaEoJ017219;
	Mon, 19 Mar 2018 14:36:14 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1521484541-8104-1-git-send-email-a0271529@ti.com>
	<1521484541-8104-6-git-send-email-a0271529@ti.com>
	<6e4d0f9b-5504-bf68-310f-3bbb77ecf38e@ti.com>
Message-ID: <104812da-96ef-c6f8-ba81-9151053184ed@ti.com>
Date: Mon, 19 Mar 2018 15:36:14 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <6e4d0f9b-5504-bf68-310f-3bbb77ecf38e@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk 5/6] [PATCH] tiovx-app-host: enable compilation of app-host and tutorial example on target
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
X-List-Received-Date: Mon, 19 Mar 2018 19:37:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 3/19/2018 3:04 PM, Jacob Stiffler wrote:
>
>
> On 3/19/2018 2:35 PM, Hongmei Gou wrote:
>> * Copy source files and makefiles to target
>> * Create setenv.sh and copy it to target
>> * Create examples package with tiovx-lib-host dependencies specified
>> * Build procedure on target: "source setenv.sh; make"
>>
>> Signed-off-by: Hongmei Gou <a0271529@ti.com>
>> ---
>>   recipes-ti/tiovx/tiovx-app-host.bb | 23 +++++++++++++++++++++--
>>   1 file changed, 21 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-ti/tiovx/tiovx-app-host.bb 
>> b/recipes-ti/tiovx/tiovx-app-host.bb
>> index eb312b3..093025e 100644
>> --- a/recipes-ti/tiovx/tiovx-app-host.bb
>> +++ b/recipes-ti/tiovx/tiovx-app-host.bb
>> @@ -4,13 +4,19 @@ DESCRIPTION = "TI OpenVX implementation, TIOVX, 
>> includes Khronos defined conform
>>   LICENSE = "BSD-3-Clause & MIT"
>>   LIC_FILES_CHKSUM = 
>> "file://docs/manifest/TIOVX-APP-HOST_01.00.01.00_manifest.html;md5=247d7c56d783f583bf802490d5c93db3"
>>   +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
>> +
>> +SRC_URI_append += "\
>> +     file://setenv.sh \
>> +"

And setenv.sh was not added in this patch.

>> +
>>   require recipes-ti/includes/tisdk-paths.inc
>>   require tiovx-sys.inc
>>     DEPENDS = " tiovx-sys-iface tiovx-lib-host ti-ipc cmem opencv"
>>   RDEPENDS_${PN} = " tiovx-sys-iface tiovx-sys-iface-firmware 
>> tiovx-lib-host ti-ipc cmem "
>>   -PR = "r1"
>> +PR = "r2"
>>     COMPATIBLE_MACHINE = "dra7xx"
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>> @@ -28,10 +34,23 @@ do_install () {
>>       install -d ${D}${bindir}/
>>       install -m 0755 ${S}/host/bin/debug/app_host 
>> ${D}${bindir}/tiovx-app_host
>>       install -m 0755 ${S}/khronos_example/bin/debug/opticalflow 
>> ${D}${bindir}/tiovx-opticalflow
>> +
>> +    oe_runmake clean
>> +    install -d ${D}${datadir}/ti/examples/openvx
>> +    install -m 644 ${S}/products.mak ${D}${datadir}/ti/examples/openvx
>> +    install -m 644 ${S}/makefile ${D}${datadir}/ti/examples/openvx
>> +    install -m 644 ${WORKDIR}/setenv.sh 
>> ${D}${datadir}/ti/examples/openvx
>> +    cp -r ${S}/host ${D}${datadir}/ti/examples/openvx
>> +    cp -r ${S}/khronos_example ${D}${datadir}/ti/examples/openvx
>> +    cp -r ${S}/shared ${D}${datadir}/ti/examples/openvx
>>   }
>>   +PACKAGES += "${PN}-examples"
>> +FILES_${PN}-examples = "${datadir}/ti/examples/openvx"
>> +RDEPENDS_${PN}-examples = "tiovx-lib-host-staticdev tiovx-lib-host-dev"
>> +
>>   CREATE_SRCIPK = "1"
>>   SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"
>>     FILES_${PN} += "${bindir}/*"
>> -INSANE_SKIP_${PN} = "ldflags"
>> +INSANE_SKIP_${PN} = "ldflags dev-deps"
>
> Is this dev-deps skip necessary? Nothing changed in the dependencies 
> of the main package.
>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


