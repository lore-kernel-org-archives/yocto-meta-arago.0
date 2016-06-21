Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id EC3F752975
	for <meta-arago@arago-project.org>;
	Tue, 21 Jun 2016 01:11:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5L1BpJ9031893
	for <meta-arago@arago-project.org>; Mon, 20 Jun 2016 20:11:51 -0500
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5L1BoAX025851
	for <meta-arago@arago-project.org>; Mon, 20 Jun 2016 20:11:51 -0500
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5L1BmDO018602
	for <meta-arago@arago-project.org>; Tue, 21 Jun 2016 06:41:49 +0530
Received: from [172.22.218.66] (172.22.218.66) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 21 Jun 2016 06:41:47 +0530
To: Denys Dmytriyenko <denys@ti.com>
References: <1465821936-2658-1-git-send-email-a0393906@ti.com>
	<20160620210929.GE2177@edge>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <57689452.9000805@ti.com>
Date: Tue, 21 Jun 2016 06:41:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160620210929.GE2177@edge>
X-Originating-IP: [172.22.218.66]
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/3] gstreamer1.0-plugins-bad: Upgrade to 1.6.3
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
X-List-Received-Date: Tue, 21 Jun 2016 01:11:52 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,


On 21-Jun-16 2:39 AM, Denys Dmytriyenko wrote:
> On Mon, Jun 13, 2016 at 06:15:34PM +0530, Karthik Ramanan wrote:
>> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>> ---
>>   .../gstreamer1.0-plugins-bad_1.6.3.bbappend        | 23 ++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
>>
>> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
>> new file mode 100644
>> index 0000000..79d4aa9
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
>> @@ -0,0 +1,23 @@
>> +PACKAGECONFIG = "faad"
>> +
>> +PACKAGECONFIG_append_omap-a15 = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
>> +
>> +DEPENDS_append_omap-a15 = " \
>> +    libdce \
>> +    libdrm \
>> +"
> What about am3 and am4 support?
Actually, I don't have a board setup to validate on am3 and am4. I'm 
wondering if this could be adapted by someone.
>
>
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +
>> +BRANCH ?= "master"
>> +
>> +SRC_URI = "git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=git;branch=${BRANCH} \
>> +          "
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +SRCREV = "6c0aa1c20dae00ecfe8b4ca382274db3ea42f1e0"
>> +
>> +PR = "r11"
>> +
>> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> What's the need for this? ^^^
This is a place holder to allow us to overlay private patches in the future.
>


