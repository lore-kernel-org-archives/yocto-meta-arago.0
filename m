Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 2650A52A70
	for <meta-arago@arago-project.org>;
	Wed, 10 Mar 2021 20:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0B9D340BE9;
	Wed, 10 Mar 2021 20:30:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id GWuhzAEZVitY; Wed, 10 Mar 2021 20:30:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A563740429;
	Wed, 10 Mar 2021 20:30:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 10862174531; Wed, 10 Mar 2021 15:30:47 -0500 (EST)
Date: Wed, 10 Mar 2021 15:30:47 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <20210310203047.GX4892@denix.org>
References: <20210303182136.31765-1-nikhil.nd@ti.com>
	<8d2e4f84-1c71-bbf7-8d04-7ccb9725db71@ti.com>
	<ad817c2c-258c-09e3-57f4-6a30b1862da1@ti.com>
	<01c2ef99-7972-77f0-04a0-184dfe30b0bc@ti.com>
	<b00e149b-161c-7d0c-9a0d-a1c09ec4c53c@ti.com>
MIME-Version: 1.0
In-Reply-To: <b00e149b-161c-7d0c-9a0d-a1c09ec4c53c@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: saurabhnarang@ti.com, nsekhar@ti.com, kishon@ti.com, lokeshvutla@ti.com,
	meta-arago@arago-project.org, hnagalla@ti.com
Subject: Re: [meta-ti][dunfell/master][PATCH v2] packagegroups: tisdk-connectivity: Include TI wlan packages for k3 platforms
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
X-List-Received-Date: Wed, 10 Mar 2021 20:30:40 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Mar 11, 2021 at 01:15:37AM +0530, Nikhil Devshatwar wrote:
> 
> 
> On 11/03/21 12:20 am, Bajjuri, Praneeth wrote:
> >
> >
> >On 3/10/2021 12:37 PM, Nikhil Devshatwar wrote:
> >>
> >>
> >>On 10/03/21 11:00 pm, Bajjuri, Praneeth wrote:
> >>>
> >>>
> >>>On 3/3/2021 12:21 PM, Nikhil Devshatwar wrote:
> >>>>Currently, the K3 platforms do not include the TI wlan
> >>>>related packages.
> >>>>Add in the tisdk-connectivity packagegroup.
> >>>>
> >>>>Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> >>>>Suggested-by: Hari Nagalla <hnagalla@gmail.com>
> >>>>Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>
> >>>>---
> >>>>
> >>>>Notes:
> >>>>     changes from v1:
> >>>
> >>>s/meta-ti/meta-arago. Please point to right project next time.
> >>Sorry about that. Reused last command and missed this.
> >>
> >>>
> >>>>     * Drop the new recipe and simply include the existing
> >>>>packages for wilink
> >>>>       This way, all the platforms are using the same
> >>>>recipes and we don't
> >>>>       have to maintain any new recipe just for the am64xx-sk
> >>>>       The firmare will get picked from the repo
> >>>>       git://git.ti.com/wilink8-wlan/wl18xx_fw.git
> >>>>
> >>>> 
> >>>>.../packagegroups/packagegroup-arago-tisdk-connectivity.bb      
> >>>>| 1 +
> >>>>  1 file changed, 1 insertion(+)
> >>>>
> >>>>diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> >>>>
> >>>>index 11109432..ab632924 100644
> >>>>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> >>>>
> >>>>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> >>>>
> >>>>@@ -89,6 +89,7 @@ CONNECTIVITY_RDEPENDS_append_dra7xx = "\
> >>>>  CONNECTIVITY_RDEPENDS_append_k3 = "\
> >>>>      ${WLAN_COMMON} \
> >>>>      ${BT_COMMON} \
> >>>>+    ${WLAN_TI} \
> >>>>  "
> >>>
> >>>Looks like WLAN_TI and WLAN_COMMON is valid for all platforms
> >>>defined in this packagegroup.
> >>>
> >>>why not move both of them under CONNECTIVITY_RDEPENDS without
> >>>a specific platform append?.
> >>
> >>Looking at the history, the following commit split the package
> >>list into a separate group explicitly:
> >>
> >>d24fa63f33 ("packagegroup-*-connectivity: restructure WLAN & BT
> >>lists and add WLAN to K3")
> >>
> >>Where the WLAN_COMMON was added but WLAN_TI was not added.
> >
> >Thats correct, But after this patch we have WLAN_TI and
> >WLAN_COMMON for all platforms now (including K3).
> >
> >Why not do something like this.
> 
> I am not sure why the packages are split in the first place.
> If you want it like this, I will send a v3

Because at some point not all platforms supported WiFi and/or BT.

Denys


> >@@ -61,36 +61,25 @@ CONNECTIVITY_RDEPENDS = " \
> >      iproute2-devlink \
> >      net-snmp \
> >      net-snmp-server-snmpd \
> >-"
> >-
> >-CONNECTIVITY_RDEPENDS_append_ti33x = "\
> >      ${WLAN_COMMON} \
> >      ${WLAN_TI} \
> >      ${BT_COMMON} \
> >+"
> >+
> >+CONNECTIVITY_RDEPENDS_append_ti33x = "\
> >      ${BT_TI} \
> >      ${DEMO_APPS} \
> >  "
> >
> >  CONNECTIVITY_RDEPENDS_append_ti43x = "\
> >-    ${WLAN_COMMON} \
> >-    ${WLAN_TI} \
> >-    ${BT_COMMON} \
> >      ${BT_TI} \
> >      ${DEMO_APPS} \
> >  "
> >
> >  CONNECTIVITY_RDEPENDS_append_dra7xx = "\
> >-    ${WLAN_COMMON} \
> >-    ${WLAN_TI} \
> >-    ${BT_COMMON} \
> >      ${BT_TI} \
> >  "
> >
> >-CONNECTIVITY_RDEPENDS_append_k3 = "\
> >-    ${WLAN_COMMON} \
> >-    ${BT_COMMON} \
> >-"
> >-
> >
> >
> >
> >>
> >>Regards,
> >>Nikhil D
> >>>
> >>>>  RDEPENDS_${PN} = "\
> >>>>

