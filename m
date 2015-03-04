Return-Path: <ceh@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1507D52A78
	for <meta-arago@arago-project.org>;
	Wed,  4 Mar 2015 14:38:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t24Ec781032054
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 08:38:07 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24Ec6l9016701
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 08:38:06 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 08:38:05 -0600
Received: from [158.218.103.10] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24Ec5MK015359;
	Wed, 4 Mar 2015 08:38:05 -0600
Message-ID: <54F718CD.3050503@ti.com>
Date: Wed, 4 Mar 2015 09:38:05 -0500
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <20150227223435.GM6052@edge>
	<1425312208-9221-1-git-send-email-ceh@ti.com>
	<20150304003748.GA6052@edge>
In-Reply-To: <20150304003748.GA6052@edge>
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/3 v2] meta-arago-distro/recipes-devtools: serialcheck recipe
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
X-List-Received-Date: Wed, 04 Mar 2015 14:38:09 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2015 07:37 PM, Denys Dmytriyenko wrote:
> On Mon, Mar 02, 2015 at 11:03:28AM -0500, Carlos Hernandez wrote:
>> >Serialcheck is a simple utility to verify serial ports functionality.
>> >It supports all "standard" bauds listed in
>> >include/uapi/asm-generic/termbits.h
> Looks good, thanks. Just a small clarification - I see you install it in /bin
> instead of more standard /usr/bin. Is there any special reason for that?
>
>

No, it could be placed is /usr/bin. Could you change it when you apply 
the patch or do I have to submit another version?

