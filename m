Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id C744352A1C
	for <meta-arago@arago-project.org>;
	Thu, 12 Oct 2017 04:35:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9C4Zsow003448
	for <meta-arago@arago-project.org>; Wed, 11 Oct 2017 23:35:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507782954;
	bh=9RKtNbFCr07R7eOh4fRVGBVyn3LcDrfBo4Ppf15O7JU=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=wo0CrBRnvmDwQzhmyQ0n58eucHhkBaEFrk85oFYy/r0o1tBUHM3HNE3pczYAsyByy
	UA0HljasX9ZuOYjGbeXx7wyEXW+DSFs6OE4kE4zyR21ZEDtGCjXI9xNh91ruZa2+tO
	7KPdUrANObeXvXqtHl68Uwf/3UT7oyc0LwxtxoJU=
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9C4ZrF3031244
	for <meta-arago@arago-project.org>; Wed, 11 Oct 2017 23:35:54 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9C4ZpeW022459
	for <meta-arago@arago-project.org>; Thu, 12 Oct 2017 10:05:52 +0530
Received: from [172.24.157.163] (172.24.157.163) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 12 Oct 2017 10:05:51 +0530
To: Denys Dmytriyenko <denys@ti.com>
References: <1507629183-171718-1-git-send-email-a0393906@ti.com>
	<20171011194727.GA16210@edge>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <1eda4dad-036e-6ec2-875e-6b4efaa6b6a2@ti.com>
Date: Thu, 12 Oct 2017 10:05:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171011194727.GA16210@edge>
X-Originating-IP: [172.24.157.163]
Cc: meta-arago@arago-project.org
Subject: Re: [krogoth 1/2] glsdk-util-scripts: Add the initial version of recipe
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
X-List-Received-Date: Thu, 12 Oct 2017 04:35:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

I'm in the process of including this in morty. There are some other 
patches to be included too.

Will send it out in a day or two.

Regards

Karthik


On 12-Oct-17 1:17 AM, Denys Dmytriyenko wrote:
> Is this coming to morty?
>
>
> On Tue, Oct 10, 2017 at 03:23:02PM +0530, Karthik Ramanan wrote:
>> These are utility scripts used for debugging the VPE and DSS.
>> They have been in use for very critical customer debugs and
>> it is useful to have this shipped as part of the SDK.
>>
>> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>> ---
>>   .../util-scripts/glsdk-util-scripts.bb             | 28 ++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>   create mode 100644 meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
>>
>> diff --git a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
>> new file mode 100644
>> index 0000000..87c4937
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
>> @@ -0,0 +1,28 @@
>> +DESCRIPTION = "Utility scripts for debug"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://debug/filter-dmesg-rproc.sh;md5=ce264e7cbc036fd2f37073947c2f0800"
>> +PR = "r1"
>> +
>> +COMPATIBLE_MACHINE = "omap-a15"
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +
>> +SRC_URI = "git://git.ti.com/glsdk/util-scripts.git"
>> +
>> +SRCREV = "ecbb9cd13e1728686a82e87e5c1b325c0e806202"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +do_compile() {
>> +    :
>> +}
>> +
>> +do_install() {
>> +    install -d ${D}${datadir}/ti/util-scripts
>> +    install -d ${D}${datadir}/ti/util-scripts/debug
>> +    install -d ${D}${datadir}/ti/util-scripts/perf
>> +    install -m 0644 ${S}/debug/* ${D}${datadir}/ti/util-scripts/debug/.
>> +    install -m 0644 ${S}/perf/* ${D}${datadir}/ti/util-scripts/perf/.
>> +}
>> +
>> +FILES_${PN} += "${datadir}/ti/util-scripts/*"
>> +
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


