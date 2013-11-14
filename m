Return-Path: <heroor@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 857E552A56
	for <meta-arago@arago-project.org>;
	Thu, 14 Nov 2013 06:00:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAE60f1G019839
	for <meta-arago@arago-project.org>; Thu, 14 Nov 2013 00:00:41 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAE60e5D029942
	for <meta-arago@arago-project.org>; Thu, 14 Nov 2013 00:00:41 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 14 Nov 2013 00:00:41 -0600
Received: from [172.24.157.152] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAE60bJ1031969;
	Thu, 14 Nov 2013 00:00:38 -0600
Message-ID: <52846705.3050908@ti.com>
Date: Thu, 14 Nov 2013 11:30:37 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>
References: <20131025093335.GA20172@ti.com>
	<20131025103440.GB13772@edge>	<8F29D6B095ED194EA1980491A5E029710C58765A@DFLE08.ent.ti.com>	<7D46E86EC0A8354091174257B2FED101597DC30B@DLEE11.ent.ti.com>	<20131030225728.GA24696@edge>	<CF956B779D819D41BBC043B7082161D545CFC7@DBDE04.ent.ti.com>	<7D46E86EC0A8354091174257B2FED1015980ADA9@DLEE11.ent.ti.com>
	<20131111192507.GB24766@denix.org>
In-Reply-To: <20131111192507.GB24766@denix.org>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper
	Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 0/5] GStreamer multimedia framework and plugins recipes
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
X-List-Received-Date: Thu, 14 Nov 2013 06:00:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2013 12:55 AM, Denys Dmytriyenko wrote:
> Just one thing to remember - we are talking here about 0.10.x line of
> gstreamer and plugins. With the recent release of gstreamer 1.0, upstream is
> no longer paying any attention to the old codebase, not even accepting bug
> fixes...
>
Just to add, a lot of these patches are as a result of TI working 
closely with Collabora on OMAP4 GLP. On the question of upstream picking 
them, it's moot because we will need to move to Gstreamer 1.2+ next year 
anyways.

--
Sid

