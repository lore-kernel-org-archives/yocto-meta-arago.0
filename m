Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id EB9E052A99
	for <meta-arago@arago-project.org>;
	Mon,  8 Jun 2015 13:05:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t58D5TiA024667
	for <meta-arago@arago-project.org>; Mon, 8 Jun 2015 08:05:29 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t58D5TJA019998
	for <meta-arago@arago-project.org>; Mon, 8 Jun 2015 08:05:29 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 8 Jun 2015 08:05:28 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t58D5SxE015821	for
	<meta-arago@arago-project.org>; Mon, 8 Jun 2015 08:05:28 -0500
Message-ID: <55759318.1010904@ti.com>
Date: Mon, 8 Jun 2015 09:05:28 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: meta-qt5
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
X-List-Received-Date: Mon, 08 Jun 2015 13:05:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

It appears that the meta-qt5 layer has dropped the 5.4.1 versioned 
recipes. This means that the meta-arago bbappends no longer apply.

I see there is a history of meta-arago using the versioned recipes, but 
these are no longer there, and only the git based recipes remain.

I'm not sure of the impact there would be in moving the meta-arago 
appends to the git based recipes. I'll give this a try and provide an 
update later.

- Jake



