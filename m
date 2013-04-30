Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id AF1AA52972
	for <meta-arago@arago-project.org>;
	Tue, 30 Apr 2013 13:50:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3UDoSO4018255
	for <meta-arago@arago-project.org>; Tue, 30 Apr 2013 08:50:28 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3UDoSm4007991
	for <meta-arago@arago-project.org>; Tue, 30 Apr 2013 08:50:28 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 30 Apr 2013 08:50:28 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r3UDoSXU006343;
	Tue, 30 Apr 2013 08:50:28 -0500
Date: Tue, 30 Apr 2013 09:50:27 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130430135027.GD30148@edge>
References: <1366524535-13207-1-git-send-email-eyalr@ti.com>
	<8665E2433BC68541A24DFFCA87B70F5B17C74011@DNCE04.ent.ti.com>
	<20130423193529.GG11449@edge>
	<8665E2433BC68541A24DFFCA87B70F5B17C7B2A7@DNCE04.ent.ti.com>
	<E6295660-AB91-4931-8F91-7ECACB239F85@ti.com>
MIME-Version: 1.0
In-Reply-To: <E6295660-AB91-4931-8F91-7ECACB239F85@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Zarmi,
	Ilan" <ilanz@ti.com>, "Sasover, Inon" <inon@ti.com>
Subject: Re: [PATCH v3 1/9] wlconf: configuration utility for wilink8 wireless driver
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
X-List-Received-Date: Tue, 30 Apr 2013 13:50:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Correct.
http://arago-project.org/git/?p=meta-arago.git;a=commit;h=556c5accab0fdadb74b8302aa1893eab9e7097a8

-- 
Denys

On Tue, Apr 30, 2013 at 08:20:24AM -0400, Cooper Jr., Franklin wrote:
> Your patch set was committed April 24th.
> 
> On Apr 30, 2013, at 1:14 AM, "Reizer, Eyal" <eyalr@ti.com> wrote:
> 
> > Hi Denys,
> > 
> > Ping again on this set of wilink8 recipes.
> > 
> > Best Regards,
> > Eyal Reizer
> > 
> >> -----Original Message-----
> >> From: Reizer, Eyal
> >> Sent: Wednesday, April 24, 2013 10:06 AM
> >> To: Dmytriyenko, Denys
> >> Cc: meta-arago@arago-project.org
> >> Subject: RE: [meta-arago] [PATCH v3 1/9] wlconf: configuration utility
> >> for wilink8 wireless driver
> >> 
> >> Denys,
> >> 
> >> Thanks for the update.
> >> Please let me know in case you need my help.
> >> 
> >> Best Regards,
> >> Eyal
> >> 
> >>> -----Original Message-----
> >>> From: Dmytriyenko, Denys
> >>> Sent: Tuesday, April 23, 2013 10:35 PM
> >>> To: Reizer, Eyal
> >>> Cc: meta-arago@arago-project.org
> >>> Subject: Re: [meta-arago] [PATCH v3 1/9] wlconf: configuration
> >> utility
> >>> for wilink8 wireless driver
> >>> 
> >>> Eyal,
> >>> 
> >>> Not yet - it failed to apply wpa-supplicant patch when I tried
> >>> yesterday. I may need to massage the patches, once I have time...
> >>> 
> >>> --
> >>> Denys
> >>> 
> >>> 
> >>> On Tue, Apr 23, 2013 at 08:58:33AM +0000, Reizer, Eyal wrote:
> >>>> Ping on this set of wilink8 related patches.
> >>>> 
> >>>> Regards,
> >>>> Eyal
> >>>> 
> >>>>> -----Original Message-----
> >>>>> From: Reizer, Eyal
> >>>>> Sent: Sunday, April 21, 2013 9:09 AM
> >>>>> To: meta-arago@arago-project.org
> >>>>> Cc: Reizer, Eyal
> >>>>> Subject: [PATCH v3 1/9] wlconf: configuration utility for wilink8
> >>>>> wireless driver
> >>>>> 
> >>>>> Add a recipe for building and installing the wlconf configuration
> >>>>> utility for TI Wilink8 family of chips.
> >>>>> 
> >>>>> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> >>>>> ---
> >>>>> Changes in v2:
> >>>>> * Rename to use an actual release name instead of _git
> >>>>> * Line indentation fixes
> >>>>> Changes in v3:
> >>>>> * Drop the PV assignment
> >>>>> 
> >>>>> .../recipes-connectivity/wlconf/wlconf_r8.a6.01.bb |   36
> >>>>> ++++++++++++++++++++
> >>>>> 1 file changed, 36 insertions(+)
> >>>>> create mode 100644 meta-arago-extras/recipes-
> >>>>> connectivity/wlconf/wlconf_r8.a6.01.bb
> >>>>> 
> >>>>> diff --git a/meta-arago-extras/recipes-
> >>>>> connectivity/wlconf/wlconf_r8.a6.01.bb
> >>>>> b/meta-arago-extras/recipes-
> >>>>> connectivity/wlconf/wlconf_r8.a6.01.bb
> >>>>> new file mode 100644
> >>>>> index 0000000..ade2e84
> >>>>> --- /dev/null
> >>>>> +++ b/meta-arago-extras/recipes-
> >>> connectivity/wlconf/wlconf_r8.a6.01.bb
> >>>>> @@ -0,0 +1,36 @@
> >>>>> +DESCRIPTION = "Configuration utility for TI wireless drivers"
> >>>>> +LICENSE = "GPLv2"
> >>>>> +LIC_FILES_CHKSUM =
> >> "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a
> >>> 9
> >>>>> 438"
> >>>>> +
> >>>>> +PR ="r1"
> >>>>> +PR_append = "+gitr${SRCREV}"
> >>>>> +
> >>>>> +SRCREV = "ol_r8.a6.01"
> >>>>> +SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git"
> >>>>> +
> >>>>> +S = "${WORKDIR}/git/wlconf"
> >>>>> +
> >>>>> +EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc"
> >>>>> +
> >>>>> +do_install() {
> >>>>> +    install -d ${D}${bindir}
> >>>>> +    install -d ${D}${bindir}/wlconf/
> >>>>> +    install -d ${D}${bindir}/wlconf/official_inis
> >>>>> +
> >>>>> +    install -m 0755 wlconf ${D}${bindir}/wlconf/
> >>>>> +    install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
> >>>>> +    install -m 0755 struct.bin ${D}${bindir}/wlconf/
> >>>>> +    install -m 0755 wl18xx-conf-default.bin
> >> ${D}${bindir}/wlconf/
> >>>>> +    install -m 0755 README ${D}${bindir}/wlconf/
> >>>>> +    install -m 0755 example.conf ${D}${bindir}/wlconf/
> >>>>> +    install -m 0755 example.ini ${D}${bindir}/wlconf/
> >>>>> +    install -m 0755 ${S}/official_inis/*
> >>>>> +            ${D}${bindir}/wlconf/official_inis/
> >>>>> +}
> >>>>> +
> >>>>> +FILES_${PN} += " \
> >>>>> +    ${bindir}/wlconf \
> >>>>> +    ${bindir}/wlconf/official_inis \ "
> >>>>> +
> >>>>> +FILES_${PN}-dbg += "${bindir}/wlconf/.debug"
> >>>>> --
> >>>>> 1.7.9.5
> >>>> 
> >>>> _______________________________________________
> >>>> meta-arago mailing list
> >>>> meta-arago@arago-project.org
> >>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

