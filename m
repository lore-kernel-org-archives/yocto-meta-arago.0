Return-Path: <anandb@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 41D97529C9
	for <meta-arago@arago-project.org>;
	Fri,  5 Feb 2016 07:07:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1577YO0024490
	for <meta-arago@arago-project.org>; Fri, 5 Feb 2016 01:07:34 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1577YQl015055
	for <meta-arago@arago-project.org>; Fri, 5 Feb 2016 01:07:34 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 5 Feb 2016 01:07:34 -0600
Received: from [172.24.145.15] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1577WSF002147;
	Fri, 5 Feb 2016 01:07:33 -0600
To: Denys Dmytriyenko <denys@ti.com>
References: <1454424195-11064-1-git-send-email-anandb@ti.com>
	<20160204183559.GO31480@edge>
From: Anand Balagopalakrishnan <anandb@ti.com>
Message-ID: <56B44A9E.1090204@ti.com>
Date: Fri, 5 Feb 2016 12:39:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20160204183559.GO31480@edge>
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/1] weston: restrict udev enumeration to /dev/dri/card0
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
X-List-Received-Date: Fri, 05 Feb 2016 07:07:35 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

I plan to push the embedded patch to wayland-devel. We could have a 
rework of this patch based on comments.

Nonetheless, I have no doubt that this patch is indeed required. The 
current Weston code is not factoring in the embedded SoC configurations.

Regards,
Anand

On Friday 05 February 2016 12:05 AM, Denys Dmytriyenko wrote:
> Anand,
>
> Is this patch meant to be upstreamed? Or is this rather a hack for our
> own setup? If latter, please add the patch to weston_1.9.0.bbappend in
> meta-arago-distro instead of the main recipe. Thanks.
>


