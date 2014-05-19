Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 717B7529A6
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 20:14:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JKEwnG012787
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 15:14:58 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JKEwu7031103
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 15:14:58 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Mon, 19 May 2014 15:14:58 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 03/19] gst-plugins-bad: Append with TI
	version of plugins
Thread-Index: AQHPc5jiw1pKzkBePEialp+6yay06ptIVojw
Date: Mon, 19 May 2014 20:14:57 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D02A5CF@DLEE11.ent.ti.com>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
	<1400527207-17021-4-git-send-email-Chase.Maupin@ti.com>
	<20140519193107.GF21819@edge>
In-Reply-To: <20140519193107.GF21819@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 03/19] gst-plugins-bad: Append with TI version of plugins
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
X-List-Received-Date: Mon, 19 May 2014 20:14:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Monday, May 19, 2014 2:31 PM
>To: Maupin, Chase
>Cc: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH 03/19] gst-plugins-bad: Append
>with TI version of plugins
>
>On Mon, May 19, 2014 at 02:19:51PM -0500, Chase Maupin wrote:
>> From: Mrinmayee Hingolikar <mrinmayee@ti.com>
>>
>> * Migrated the bbappend from meta-arago-glsdk and preserved
>>   authorship for Mrinmayee
>> * This append pulls the plugin sources from the git.ti.com/glsdk
>>   repository which has modifications for using gstreamer with TI
>>   devices.
>> * Cleaned up the following for upstreaming:
>>     * Restructured the recipe code to flow better
>>     * Removed libdri2 dependencies since this was for X11
>support
>>       which was not ported.
>>     * Removed LICENSE settings since these were over-riding the
>>       base recipe LICENSE values.
>>     * Removed unneeded FILESEXTRAPATHS setting
>> * Make machines specific due to changed SRC_URI
>>
>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> ---
>>  .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |   22
>++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>  create mode 100644 meta-arago-extras/recipes-
>multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
>>
>> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-
>plugins-bad_0.10.23.bbappend b/meta-arago-extras/recipes-
>multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
>> new file mode 100644
>> index 0000000..74cc9ce
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-
>plugins-bad_0.10.23.bbappend
>> @@ -0,0 +1,22 @@
>> +DEPENDS_append_omap-a15 =3D " omap5-sgx-ddk-um-linux libdce
>libdrm wayland "
>> +
>> +# Make MACHINE specific since we pull different sources per
>MACHINE
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> +
>> +PR_append =3D "-arago1"
>> +
>> +SRCREV =3D "f2df6f3b684f39500e22115b160191cef6d7dbaf"
>
>How will this work with the same SRCREV in different repositories?

The default gst-plugins.inc file sets these recipes to use .tar.bz2 files, =
so in that case SRCREV would be ignored so I didn't bother making it machin=
e specific.  I can make this machine specific if you want though.

>
>
>> +SRC_URI_omap-a15 =3D "git://git.ti.com/glsdk/gst-plugins-bad0-
>10.git;protocol=3Dgit"
>> +
>> +S_omap-a15 =3D "${WORKDIR}/git"
>> +
>> +EXTRA_OECONF +=3D " --disable-pvr"
>> +
>> +do_configure_prepend_omap-a15() {
>> +	git submodule init && git submodule update
>> +	autopoint -f
>> +}
>> +
>> +FILES_${PN} +=3D "\
>> +                ${libdir}/*.so \
>> +                ${libdir}/gstreamer-0.10/*"
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

