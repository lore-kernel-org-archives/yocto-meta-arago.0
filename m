Return-Path: <heroor@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 58828529C9
	for <meta-arago@arago-project.org>;
	Mon, 22 Jul 2013 04:13:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6M4DdHe013227
	for <meta-arago@arago-project.org>; Sun, 21 Jul 2013 23:13:39 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6M4Ddjv010077
	for <meta-arago@arago-project.org>; Sun, 21 Jul 2013 23:13:39 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 21 Jul 2013 23:13:39 -0500
Received: from [172.24.158.133] (a0875592lt01.apr.dhcp.ti.com
	[172.24.158.133])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r6M4Da8k032382;	Sun, 21 Jul 2013 23:13:37 -0500
Message-ID: <51ECB170.300@ti.com>
Date: Mon, 22 Jul 2013 09:43:36 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Cooper Jr., Franklin" <fcooper@ti.com>
References: <CF956B779D819D41BBC043B7082161D543FB18@DBDE04.ent.ti.com>
	<F4FA69BF-19EF-4E05-BF7E-27D51BBD6B38@ti.com>
In-Reply-To: <F4FA69BF-19EF-4E05-BF7E-27D51BBD6B38@ti.com>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCHv2] abefw: Firmware for OMAP5 ABE
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
X-List-Received-Date: Mon, 22 Jul 2013 04:13:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/12/2013 6:41 PM, Cooper Jr., Franklin wrote:
> 
> 
> On Jul 12, 2013, at 1:43 AM, "Hingolikar, Mrinmayee" <mrinmayee@ti.com> wrote:
> 
>>
>> * The OMAP5 Audio Backend requires a 'firmware' to enable
>>  sound. This recipe installs a prebuilt firmware. This
>>  part is a hack, as in the current form, the firmware
>>  cannot be cross-compiled. There is a plan to fix this
>>  and hopefully, this recipe is short-lived. Once the code
>>  is fixed, we should have new recipes that build the firmware
>>  and clean up this recipe.
>>
>> v2:
>> * Merged contents from abefw.inc and removed abefw.inc based
>>  on review.
>>
>> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>> ---
>> recipes-bsp/abefw/abefw_1.0.14.bb |   20 ++++++++++++++++++++
>> 1 files changed, 20 insertions(+), 0 deletions(-)  create mode 100644 recipes-bsp/abefw/abefw_1.0.14.bb
>>
>> diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-bsp/abefw/abefw_1.0.14.bb
>> new file mode 100644
>> index 0000000..8db71e4
>> --- /dev/null
>> +++ b/recipes-bsp/abefw/abefw_1.0.14.bb
>> @@ -0,0 +1,20 @@
>> +SUMMARY = "Firmware for OMAP5 ABE"
>> +HOMEPAGE = "http://git.ti.com"
>> +LICENSE = "BSD/GPLv2"
> I'm assuming this means BSD or GPLv2.
> 
> The proper syntax is
> LICENSE = "BSD | GPLv2"
> 
> 
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=923db086ed9463ab3215b24d87e05ec5"
>> +
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> I don't see any machine based overrides or appends in this recipe. This isn't needed. 
> 
>> +COMPATIBLE_MACHINE = "omap5-evm"
> I'm just curious if the dra7xx or any other possible future boards will be using this firmware/recipe. If so any harm in making this generic and specifying omap-a15?

This is an IP *specific* to OMAP4/5. On OMAP5, the ABE (Audio Backend)
is present to allow for low power audio playback. Refer TRM
(http://www.ti.com/lit/ug/swpu249w/swpu249w.pdf) section 13. - Audio
Subsystem.

On DRA7xx ABE isn't present. Instead we have multiple McASPs (upto 8)
for which no firmware is required. McASP has its own sound driver (which
should be common to other devices).

By setting COMPATIBILITY and PACKAGE_ARCH to be limited to omap5, we
make it obvious that the IP is OMAP5 specific and not generic for all
omap-a15 devices.


>> +
>> +SRC_URI = "git://git.ti.com/glsdk/abefw-omap4plus.git;protocol=git"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +SRCREV = "ceccc0332264e39bdc51e54f80ea7256a3886c58"
>> +
>> +do_install() {
>> +        mkdir -p ${D}/lib/firmware
>> +        cp ${S}/firmware/omap4_abe_new ${D}/lib/firmware/ }
>> +
>> +FILES_${PN} += "/lib/firmware/omap4_abe_new"
>> --
>> 1.7.0.4
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 


