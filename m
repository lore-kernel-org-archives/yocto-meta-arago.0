Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id BE7A552A86
	for <meta-arago@arago-project.org>;
	Tue, 21 Apr 2015 04:20:11 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3L4K9QH028773
	for <meta-arago@arago-project.org>; Mon, 20 Apr 2015 23:20:10 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3L4K6A2008449
	for <meta-arago@arago-project.org>; Tue, 21 Apr 2015 09:50:07 +0530
Received: from [172.24.158.135] (172.24.158.135) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 21 Apr 2015 09:50:05 +0530
Message-ID: <5535CFF5.70301@ti.com>
Date: Tue, 21 Apr 2015 09:50:05 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "R, Karthik"
	<karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
References: <1429196326-11255-1-git-send-email-a0393906@ti.com>
	<4B26FB5A64EBA14C87266869E037F95814121E6D@DFLE09.ent.ti.com>
In-Reply-To: <4B26FB5A64EBA14C87266869E037F95814121E6D@DFLE09.ent.ti.com>
X-Originating-IP: [172.24.158.135]
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
X-List-Received-Date: Tue, 21 Apr 2015 04:20:12 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Jake,

Can you point me to the libgles-omap3-rawdemos package?
I couldn't find the bb file corresponding to this.

Regards
Karthik

On 20-Apr-15 6:01 PM, Stiffler, Jacob wrote:
> Karthik,
>
> Can this be modified so that the installation of the demos matches the installation of the libgles-omap3-rawdemos package for AM3 and AM4 so that Matrix scripts may be reused on the platforms?
>
> Thanks,
> Jake
>
> On 4/16/2015 10:58 AM, Karthik Ramanan wrote:
>> * This is a package with pre-built demos
>> * These demos will work on DRM
>> * Also contains utilities for SGX performance measurement
>>
>> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>> ---
>> .../imgpvrsdk/img-pvr-sdk_3.3.2.bb                 |   29 ++++++++++++++++++++
>> 1 file changed, 29 insertions(+)
>> create mode 100644 meta-arago-extras/recipes-graphics/imgpvrsdk/img-pvr-sdk_3.3.2.bb
>>
>> diff --git a/meta-arago-extras/recipes-graphics/imgpvrsdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/imgpvrsdk/img-pvr-sdk_3.3.2.bb
>> new file mode 100644
>> index 0000000..9387a74
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-graphics/imgpvrsdk/img-pvr-sdk_3.3.2.bb
>> @@ -0,0 +1,29 @@
>> +DESCRIPTION = "Imagination PowerVR SDK binaries for Jacinto6 SoC"
>> +LICENSE = "TI-TSPA"
>> +LIC_FILES_CHKSUM = "file://Jacinto6-IMG-PowerVR-SDK-Manifest.pdf;md5=46bcbfc69f8837c339e15fd4a5044a8c"
>> +
>> +SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git"
>> +SRCREV = "c2456ec3f03da022fb7489d6b381a4ac26a68203"
>> +
>> +PR = "r1"
>> +
>> +COMPATIBLE_MACHINE = "dra7xx"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +do_install () {
>> +    oe_runmake install DESTDIR=${D}
>> +}
>> +
>> +
>> +INHIBIT_PACKAGE_STRIP = "1"
>> +
>> +INSANE_SKIP_${PN} += "dev-so"
>> +
>> +FILES_${PN} += "/opt/img-powervr-sdk/Examples/Advanced/OGLES2ChameleonMan \
>> +                /opt/img-powervr-sdk/Examples/Advanced/OGLES2Coverflow \
>> +                /opt/img-powervr-sdk/Examples/Advanced/OGLES2ExampleUI \
>> +                /opt/img-powervr-sdk/Examples/Advanced/OGLES2Navigation \
>> +                /opt/img-powervr-sdk/PVRHub/* \
>> +                /opt/img-powervr-sdk/PVRScopeDeveloper/* \
>> +               "


