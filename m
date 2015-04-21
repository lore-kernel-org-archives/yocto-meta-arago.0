Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8D413529AF
	for <meta-arago@arago-project.org>;
	Tue, 21 Apr 2015 10:24:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3LAOBpD015076
	for <meta-arago@arago-project.org>; Tue, 21 Apr 2015 05:24:11 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3LAOAAG030591
	for <meta-arago@arago-project.org>; Tue, 21 Apr 2015 05:24:10 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 21 Apr 2015 05:24:10 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3LAOANl017748;
	Tue, 21 Apr 2015 05:24:10 -0500
Message-ID: <5536254A.7030309@ti.com>
Date: Tue, 21 Apr 2015 06:24:10 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Karthik Ramanan <a0393906@ti.com>, "R, Karthik" <karthik.ramanan@ti.com>, 
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
References: <1429196326-11255-1-git-send-email-a0393906@ti.com>
	<4B26FB5A64EBA14C87266869E037F95814121E6D@DFLE09.ent.ti.com>
	<5535CFF5.70301@ti.com>
In-Reply-To: <5535CFF5.70301@ti.com>
Subject: Re: [meta-arago PATCH v2] img-pvr-sdk: IMG PowerVR SDK based demos
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
X-List-Received-Date: Tue, 21 Apr 2015 10:24:12 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

This package is specified in 
meta-ti/recipes-graphics/libgles/libgles-omap3-no-x.inc

Basically, the OGLES* example binaries are installed to 
${bindir}/SGX/demos/Raw/

On 4/21/2015 12:20 AM, Karthik Ramanan wrote:
> Jake,
>
> Can you point me to the libgles-omap3-rawdemos package?
> I couldn't find the bb file corresponding to this.
>
> Regards
> Karthik
>
> On 20-Apr-15 6:01 PM, Stiffler, Jacob wrote:
>> Karthik,
>>
>> Can this be modified so that the installation of the demos matches 
>> the installation of the libgles-omap3-rawdemos package for AM3 and 
>> AM4 so that Matrix scripts may be reused on the platforms?
>>
>> Thanks,
>> Jake
>>
>> On 4/16/2015 10:58 AM, Karthik Ramanan wrote:
>>> * This is a package with pre-built demos
>>> * These demos will work on DRM
>>> * Also contains utilities for SGX performance measurement
>>>
>>> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>>> ---
>>> .../imgpvrsdk/img-pvr-sdk_3.3.2.bb                 |   29 
>>> ++++++++++++++++++++
>>> 1 file changed, 29 insertions(+)
>>> create mode 100644 
>>> meta-arago-extras/recipes-graphics/imgpvrsdk/img-pvr-sdk_3.3.2.bb
>>>
>>> diff --git 
>>> a/meta-arago-extras/recipes-graphics/imgpvrsdk/img-pvr-sdk_3.3.2.bb 
>>> b/meta-arago-extras/recipes-graphics/imgpvrsdk/img-pvr-sdk_3.3.2.bb
>>> new file mode 100644
>>> index 0000000..9387a74
>>> --- /dev/null
>>> +++ b/meta-arago-extras/recipes-graphics/imgpvrsdk/img-pvr-sdk_3.3.2.bb
>>> @@ -0,0 +1,29 @@
>>> +DESCRIPTION = "Imagination PowerVR SDK binaries for Jacinto6 SoC"
>>> +LICENSE = "TI-TSPA"
>>> +LIC_FILES_CHKSUM = 
>>> "file://Jacinto6-IMG-PowerVR-SDK-Manifest.pdf;md5=46bcbfc69f8837c339e15fd4a5044a8c"
>>> +
>>> +SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git"
>>> +SRCREV = "c2456ec3f03da022fb7489d6b381a4ac26a68203"
>>> +
>>> +PR = "r1"
>>> +
>>> +COMPATIBLE_MACHINE = "dra7xx"
>>> +
>>> +S = "${WORKDIR}/git"
>>> +
>>> +do_install () {
>>> +    oe_runmake install DESTDIR=${D}
>>> +}
>>> +
>>> +
>>> +INHIBIT_PACKAGE_STRIP = "1"
>>> +
>>> +INSANE_SKIP_${PN} += "dev-so"
>>> +
>>> +FILES_${PN} += 
>>> "/opt/img-powervr-sdk/Examples/Advanced/OGLES2ChameleonMan \
>>> + /opt/img-powervr-sdk/Examples/Advanced/OGLES2Coverflow \
>>> + /opt/img-powervr-sdk/Examples/Advanced/OGLES2ExampleUI \
>>> + /opt/img-powervr-sdk/Examples/Advanced/OGLES2Navigation \
>>> +                /opt/img-powervr-sdk/PVRHub/* \
>>> +                /opt/img-powervr-sdk/PVRScopeDeveloper/* \
>>> +               "
>


