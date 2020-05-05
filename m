Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 3716B5298B
	for <meta-arago@arago-project.org>;
	Tue,  5 May 2020 11:14:30 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 045BC7ET033425;
	Tue, 5 May 2020 06:12:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588677127;
	bh=+MtTtEyoSCOEaVKFua9juzCVzbrptg0f1nw6pWHTM5k=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=i7iMMQfCDME2oJk1NPqjHhbUobOff03khv6sgZG5ATyIvcPnINk2GvwLXUV9QTZUz
	P/bB3/Xmi9g7HGL4afe1PvrUaQUFBeCT3T00o+9bhbLgFhjTcdYAfj2YUpP7Imeb3k
	3XI2qyFxHLRFSynJweNRVy5E9TYK7JGrXwpevf5I=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 045BC70v065676
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 May 2020 06:12:07 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 5 May 2020 06:12:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 5 May 2020 06:12:07 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 045BC6Po108789;
	Tue, 5 May 2020 06:12:06 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1588625682-33592-1-git-send-email-denis@denix.org>
	<1588625682-33592-2-git-send-email-denis@denix.org>
	<6fc6e6c601214fc083d666da2a7aff60@ti.com>
	<20200504211648.GE31934@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <c52cafc9-95e7-171b-61dd-f5b1a8870995@ti.com>
Date: Tue, 5 May 2020 07:12:05 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504211648.GE31934@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [EXTERNAL] [master][PATCH 2/4] toolchain: remove secondary toolchain hack
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
X-List-Received-Date: Tue, 05 May 2020 11:14:30 -0000
Content-Type: multipart/alternative;
	boundary="------------99808F2E43356801AB88BACA"
Content-Language: en-US

--------------99808F2E43356801AB88BACA
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 5/4/2020 5:16 PM, Denys Dmytriyenko wrote:
> On Mon, May 04, 2020 at 09:06:32PM +0000, Stiffler, Jacob wrote:
>> This was for adding the R5 toolchain into the devkit so that we can build
>> the R5 u-boot from the SDK.
> Which would have to be done properly now, following multiconfig changes in
> meta-ti, not as a hack, which won't work and conflicts with those changes...


What is the proper way to provide a prebuilt external toolchain inside 
the SDK?


> This is unfortunate, but is necessary for many existing and upcoming features.


I do not see why the multiconfig change impacts this secondary 
toolchain. This change is relatively independent and is only needed to 
add the armv7 toolchain to the devkit.

Can you update the commit message, because this is still needed if you 
wish to build the R5 u-boot using the devkit.


>
>>> -----Original Message-----
>>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>>> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>>> Sent: Monday, May 04, 2020 4:55 PM
>>> To: meta-arago@arago-project.org
>>> Subject: [EXTERNAL] [meta-arago] [master][PATCH 2/4] toolchain: remove
>>> secondary toolchain hack
>>>
>>> From: Denys Dmytriyenko <denys@ti.com>
>>>
>>> With K3 R5F support in meta-ti now, this hack is no longer needed.
>>>
>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>> ---
>>>   meta-arago-distro/conf/distro/include/toolchain-arm.inc        |  6 ------
>>>   .../recipes-core/meta/external-arm-secondary-sdk-toolchain.bb  |  4 ----
>>>   .../packagegroups/packagegroup-cross-canadian.bbappend         | 10 ---------
>>> -
>>>   3 files changed, 20 deletions(-)
>>>   delete mode 100644 meta-arago-distro/recipes-core/meta/external-arm-
>>> secondary-sdk-toolchain.bb
>>>   delete mode 100644 meta-arago-distro/recipes-
>>> core/packagegroups/packagegroup-cross-canadian.bbappend
>>>
>>> diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
>>> b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
>>> index d2c2b2f..fd63256 100644
>>> --- a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
>>> +++ b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
>>> @@ -9,9 +9,6 @@ EAT_TARGET_SYS_arm = "${EAT_TARGET_SYS_ARMV5}"
>>>   EAT_TARGET_SYS_armv7a = "${EAT_TARGET_SYS_ARMV7}"
>>>   EAT_TARGET_SYS_aarch64 = "${EAT_TARGET_SYS_ARMV8}"
>>>
>>> -SECONDARY_TARGET_ARCH = ""
>>> -SECONDARY_TARGET_ARCH_k3 = "armv7a"
>>> -
>>>   TARGET_VENDOR = ""
>>>
>>>   TOOLCHAIN_BASE ?= "/opt"
>>> @@ -34,9 +31,6 @@ PREFERRED_PROVIDER_gcc-cross-canadian-
>>> ${TRANSLATED_TARGET_ARCH} ?= "external-arm
>>>   PREFERRED_PROVIDER_binutils-cross-canadian-
>>> ${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain"
>>>   #PREFERRED_PROVIDER_gdb-cross-canadian-
>>> ${TRANSLATED_TARGET_ARCH} = "external-arm-sdk-toolchain"
>>>
>>> -PREFERRED_PROVIDER_gcc-cross-canadian-${SECONDARY_TARGET_ARCH}
>>> ?= "external-arm-secondary-sdk-toolchain"
>>> -PREFERRED_PROVIDER_binutils-cross-canadian-
>>> ${SECONDARY_TARGET_ARCH} ?= "external-arm-secondary-sdk-toolchain"
>>> -
>>>   # Special case for gdb to be built as part of canadian-cross-sdk, instead of
>>> packaged from external toolchain
>>>   bindir_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =
>>> "${exec_prefix}/bin"
>>>   PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}
>>> = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>>> diff --git a/meta-arago-distro/recipes-core/meta/external-arm-secondary-
>>> sdk-toolchain.bb b/meta-arago-distro/recipes-core/meta/external-arm-
>>> secondary-sdk-toolchain.bb
>>> deleted file mode 100644
>>> index 22a8aa0..0000000
>>> --- a/meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-
>>> toolchain.bb
>>> +++ /dev/null
>>> @@ -1,4 +0,0 @@
>>> -TARGET_ARCH := "${SECONDARY_TARGET_ARCH}"
>>> -MACHINEOVERRIDES := "${SECONDARY_TARGET_ARCH}"
>>> -
>>> -require recipes-core/meta/external-arm-sdk-toolchain.bb
>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>>> cross-canadian.bbappend b/meta-arago-distro/recipes-
>>> core/packagegroups/packagegroup-cross-canadian.bbappend
>>> deleted file mode 100644
>>> index fb728e0..0000000
>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-
>>> canadian.bbappend
>>> +++ /dev/null
>>> @@ -1,10 +0,0 @@
>>> -PR_append = ".arago0"
>>> -
>>> -SECONDARY_TARGET_ARCH ?= ""
>>> -
>>> -SECONDARY_TOOLCHAIN = "gcc-cross-canadian-
>>> ${SECONDARY_TARGET_ARCH} \
>>> -                       binutils-cross-canadian-${SECONDARY_TARGET_ARCH}"
>>> -
>>> -RDEPENDS_${PN}_append = " \
>>> -    ${@oe.utils.conditional('SECONDARY_TARGET_ARCH', '', '',
>>> '${SECONDARY_TOOLCHAIN}', d)} \
>>> -"
>>> --
>>> 2.7.4
>>>
>>> _______________________________________________
>>> meta-arago mailing list
>>> meta-arago@arago-project.org
>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--------------99808F2E43356801AB88BACA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/4/2020 5:16 PM, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200504211648.GE31934@beryl">
      <pre class="moz-quote-pre" wrap="">On Mon, May 04, 2020 at 09:06:32PM +0000, Stiffler, Jacob wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This was for adding the R5 toolchain into the devkit so that we can build 
the R5 u-boot from the SDK.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Which would have to be done properly now, following multiconfig changes in 
meta-ti, not as a hack, which won't work and conflicts with those changes...
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>What is the proper way to provide a prebuilt external toolchain
      inside the SDK?<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20200504211648.GE31934@beryl">
      <pre class="moz-quote-pre" wrap="">
This is unfortunate, but is necessary for many existing and upcoming features.
</pre>
    </blockquote>
    <p><!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <w:DoNotOptimizeForBrowser/>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"
  DefSemiHidden="true" DefQFormat="false" DefPriority="99"
  LatentStyleCount="267">
  <w:LsdException Locked="false" Priority="0" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>
  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" Priority="10" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" Priority="11" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" Priority="22" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" Priority="59" SemiHidden="false"
   UnhideWhenUsed="false" Name="Table Grid"/>
  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;}
</style>
<![endif]-->
      <p class="MsoPlainText"><span style="color:black"><br>
        </span></p>
      <p class="MsoPlainText"><span style="color:black">I do not see why
          the
          multiconfig change impacts this secondary toolchain. This
          change is relatively
          independent and is only needed to add the armv7 toolchain to
          the devkit. </span></p>
      <p class="MsoPlainText"><span style="color:black"> </span></p>
      <p class="MsoPlainText"><span style="color:black">Can you update
          the commit message, because this is still needed if you wish
          to build the R5 u-boot using the devkit.<br>
        </span></p>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20200504211648.GE31934@beryl">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: <a class="moz-txt-link-abbreviated" href="mailto:meta-arago-bounces@arago-project.org">meta-arago-bounces@arago-project.org</a> [<a class="moz-txt-link-freetext" href="mailto:meta-arago">mailto:meta-arago</a>-
<a class="moz-txt-link-abbreviated" href="mailto:bounces@arago-project.org">bounces@arago-project.org</a>] On Behalf Of Denys Dmytriyenko
Sent: Monday, May 04, 2020 4:55 PM
To: <a class="moz-txt-link-abbreviated" href="mailto:meta-arago@arago-project.org">meta-arago@arago-project.org</a>
Subject: [EXTERNAL] [meta-arago] [master][PATCH 2/4] toolchain: remove
secondary toolchain hack

From: Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denys@ti.com">&lt;denys@ti.com&gt;</a>

With K3 R5F support in meta-ti now, this hack is no longer needed.

Signed-off-by: Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denys@ti.com">&lt;denys@ti.com&gt;</a>
---
 meta-arago-distro/conf/distro/include/toolchain-arm.inc        |  6 ------
 .../recipes-core/meta/external-arm-secondary-sdk-toolchain.bb  |  4 ----
 .../packagegroups/packagegroup-cross-canadian.bbappend         | 10 ---------
-
 3 files changed, 20 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/meta/external-arm-
secondary-sdk-toolchain.bb
 delete mode 100644 meta-arago-distro/recipes-
core/packagegroups/packagegroup-cross-canadian.bbappend

diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
index d2c2b2f..fd63256 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
@@ -9,9 +9,6 @@ EAT_TARGET_SYS_arm = "${EAT_TARGET_SYS_ARMV5}"
 EAT_TARGET_SYS_armv7a = "${EAT_TARGET_SYS_ARMV7}"
 EAT_TARGET_SYS_aarch64 = "${EAT_TARGET_SYS_ARMV8}"

-SECONDARY_TARGET_ARCH = ""
-SECONDARY_TARGET_ARCH_k3 = "armv7a"
-
 TARGET_VENDOR = ""

 TOOLCHAIN_BASE ?= "/opt"
@@ -34,9 +31,6 @@ PREFERRED_PROVIDER_gcc-cross-canadian-
${TRANSLATED_TARGET_ARCH} ?= "external-arm
 PREFERRED_PROVIDER_binutils-cross-canadian-
${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain"
 #PREFERRED_PROVIDER_gdb-cross-canadian-
${TRANSLATED_TARGET_ARCH} = "external-arm-sdk-toolchain"

-PREFERRED_PROVIDER_gcc-cross-canadian-${SECONDARY_TARGET_ARCH}
?= "external-arm-secondary-sdk-toolchain"
-PREFERRED_PROVIDER_binutils-cross-canadian-
${SECONDARY_TARGET_ARCH} ?= "external-arm-secondary-sdk-toolchain"
-
 # Special case for gdb to be built as part of canadian-cross-sdk, instead of
packaged from external toolchain
 bindir_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =
"${exec_prefix}/bin"
 PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}
= "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
diff --git a/meta-arago-distro/recipes-core/meta/external-arm-secondary-
sdk-toolchain.bb b/meta-arago-distro/recipes-core/meta/external-arm-
secondary-sdk-toolchain.bb
deleted file mode 100644
index 22a8aa0..0000000
--- a/meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-
toolchain.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-TARGET_ARCH := "${SECONDARY_TARGET_ARCH}"
-MACHINEOVERRIDES := "${SECONDARY_TARGET_ARCH}"
-
-require recipes-core/meta/external-arm-sdk-toolchain.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
cross-canadian.bbappend b/meta-arago-distro/recipes-
core/packagegroups/packagegroup-cross-canadian.bbappend
deleted file mode 100644
index fb728e0..0000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-
canadian.bbappend
+++ /dev/null
@@ -1,10 +0,0 @@
-PR_append = ".arago0"
-
-SECONDARY_TARGET_ARCH ?= ""
-
-SECONDARY_TOOLCHAIN = "gcc-cross-canadian-
${SECONDARY_TARGET_ARCH} \
-                       binutils-cross-canadian-${SECONDARY_TARGET_ARCH}"
-
-RDEPENDS_${PN}_append = " \
-    ${@oe.utils.conditional('SECONDARY_TARGET_ARCH', '', '',
'${SECONDARY_TOOLCHAIN}', d)} \
-"
--
2.7.4

_______________________________________________
meta-arago mailing list
<a class="moz-txt-link-abbreviated" href="mailto:meta-arago@arago-project.org">meta-arago@arago-project.org</a>
<a class="moz-txt-link-freetext" href="http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a>
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">_______________________________________________
meta-arago mailing list
<a class="moz-txt-link-abbreviated" href="mailto:meta-arago@arago-project.org">meta-arago@arago-project.org</a>
<a class="moz-txt-link-freetext" href="http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a>
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------99808F2E43356801AB88BACA--
