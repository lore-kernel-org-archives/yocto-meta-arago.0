Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id E95355298B
	for <meta-arago@arago-project.org>;
	Tue, 11 Feb 2020 13:55:13 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01BDrHGL005112
	for <meta-arago@arago-project.org>; Tue, 11 Feb 2020 07:53:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581429197;
	bh=Bcybwc1SSw12MEIa4/BfKAkkQZ8IDCiNGb/sXK3a8KE=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=o7vezURKWoWzR6WyOtpCh0ebu5hQdA1RlBEo6citRQDaV5kvPoazODPMgKELtisf1
	lRQ4IelO8Ok8Xljv+VBat97NQse79DjzpD9IGgC6kL6cPWN16aqp+5atw26vsTXNkC
	4TLBLGzwBpUMKuFG/r55iU9LuL3P240rhCIpTIq8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01BDrHux031743
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 11 Feb 2020 07:53:17 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 11 Feb 2020 07:53:17 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 11 Feb 2020 07:53:17 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BDrGba016649;
	Tue, 11 Feb 2020 07:53:17 -0600
To: Denys Dmytriyenko <denys@ti.com>, "Andrew F. Davis" <afd@ti.com>
References: <20200127162616.24864-1-afd@ti.com> <20200127194555.GW3658@beryl>
	<20200211014113.GF17543@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <f75feb41-e535-292a-22e2-f12fdb71aaba@ti.com>
Date: Tue, 11 Feb 2020 08:53:16 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211014113.GF17543@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [EXTERNAL] Re: [master/thud][PATCH] screenshot: Remove this screenshot tool in favor of fbgrab
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
X-List-Received-Date: Tue, 11 Feb 2020 13:55:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2/10/2020 8:41 PM, Denys Dmytriyenko wrote:
> On Mon, Jan 27, 2020 at 02:45:55PM -0500, Denys Dmytriyenko wrote:
>> On Mon, Jan 27, 2020 at 11:26:16AM -0500, Andrew F. Davis wrote:
>>> This takes a screenshot of the current framebuffer only. There are tools
>>> for taking screenshots of the current window system which is usually what
>>> a user wants. If the user really wants the conent of the framebuffer then
>>> they can use fbgrab which is already in meta-oe.
>> I'm not 100% sure, but I believe there's some use of screeshot tool in Matrix
>> demos. I guess we would need to update that too for this change.
>>
>> Jake, any comments from OOBE perspective?
> Ping
>

I am not able to find any reference to this screenshot tool.


- Jake


>> Denys
>>
>>
>>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>>> ---
>>>   .../packagegroup-arago-tisdk-amsdk.bb         |  5 ----
>>>   .../screenshot/screenshot_1.0.bb              | 27 -------------------
>>>   2 files changed, 32 deletions(-)
>>>   delete mode 100644 meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
>>>
>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
>>> index 42c6aefa..c9a17c5e 100644
>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
>>> @@ -17,11 +17,6 @@ OOBE_ti43x += "\
>>>       parse-ip \
>>>   "
>>>   
>>> -EXTRA_APPLICATIONS = "\
>>> -    screenshot \
>>> -"
>>> -
>>>   RDEPENDS_${PN} = "\
>>>       ${OOBE} \
>>> -    ${EXTRA_APPLICATIONS} \
>>>   "
>>> diff --git a/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb b/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
>>> deleted file mode 100644
>>> index 08a3040b..00000000
>>> --- a/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
>>> +++ /dev/null
>>> @@ -1,27 +0,0 @@
>>> -SUMMARY = "Screenshot"
>>> -HOMEPAGE = "https://gitorious.org/screenshot"
>>> -LICENSE = "BSD"
>>> -LIC_FILES_CHKSUM = "file://COPYING;md5=5cad16cc3f514a15adb1d710b82d5fc4"
>>> -SECTION = "graphics"
>>> -
>>> -PR = "r2"
>>> -
>>> -BRANCH ?= "master"
>>> -SRCREV = "169242aa7a265d5c94755d74601ad4a3f1828c96"
>>> -
>>> -SRC_URI = "git://git.ti.com/apps/screenshot.git;protocol=git;branch=${BRANCH}"
>>> -
>>> -S = "${WORKDIR}/git"
>>> -
>>> -do_compile() {
>>> -    export CROSS_COMPILE=${TARGET_PREFIX}
>>> -    export CFLAGS='${TARGET_CC_ARCH}'
>>> -    # build the release version
>>> -    make release CC="${CC}"
>>> -}
>>> -
>>> -do_install() {
>>> -    make DESTDIR=${D} install
>>> -}
>>> -
>>> -INSANE_SKIP_${PN} = "ldflags"
>>> -- 
>>> 2.17.1
>>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

