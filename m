Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 47857529C0
	for <meta-arago@arago-project.org>;
	Thu, 17 Dec 2015 23:20:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tBHNKPqx003142;
	Thu, 17 Dec 2015 17:20:25 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBHNKPYa017070;
	Thu, 17 Dec 2015 17:20:25 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 17 Dec 2015 17:20:25 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBHNKOMc016823;
	Thu, 17 Dec 2015 17:20:25 -0600
Date: Thu, 17 Dec 2015 18:20:09 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20151217232009.GP27464@edge>
References: <CADySD0FHQNG=r-um9qpbW1SQbnvZpum8mvnb19rD-4iOuZEujQ@mail.gmail.com>
	<CADySD0E+jJHqmsx+MsO-hwVr0iioSYGgRzYVs3o8RT-TzLO90w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0E+jJHqmsx+MsO-hwVr0iioSYGgRzYVs3o8RT-TzLO90w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: Bluetooth agent can't get default adapter
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
X-List-Received-Date: Thu, 17 Dec 2015 23:20:27 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Any specific reason you are trying 3.14? Can you try 4.1 instead?

-- 
Denys


On Fri, Dec 18, 2015 at 11:38:40AM +1300, Ankur Tyagi wrote:
> Further debugged it to check dbus and bluez service
> 
> ​​
> dbus is running and service file is also present
> 
> root@am335x-evm:~# cat /usr/share/dbus-1/system-services/org.bluez.service
> [D-BUS Service]
> Name=org.bluez
> Exec=/bin/false
> User=root
> SystemdService=dbus-org.bluez.service
> 
> root@am335x-evm:~# cat /etc/dbus-1/system.d/bluetooth.conf
> <!-- This configuration file specifies the required security policies
>      for Bluetooth core daemon to work. -->
> <!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration
> 1.0//EN"
>  "<a href="http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
> www.freedesktop.org/.../busconfig.dtd"></a>
> <busconfig>
>   <!-- ../system.conf have denied everything, so we just punch some holes
> -->
>   <policy user="root">
>     <allow own="org.bluez"/>
>     <allow send_destination="org.bluez"/>
>     <allow send_interface="org.bluez.Agent"/>
>     <allow send_interface="org.bluez.PasskeyAgent"/>
>   </policy>
> 
>   <policy context="default">
>     <allow own="org.bluez"/>
>     <allow send_destination="org.bluez"/>
>     <allow send_interface="org.bluez.Agent"/>
>   </policy>
> 
> </busconfig>
> 
> 
> When I run bluetoothd, I can see org.bluez in dbus list
> 
> root@am335x-evm:~# dbus-send --system --dest=org.freedesktop.DBus
> --type=method_call --print-reply /org/freedesktop/DBus
> org.freedesktop.DBus.ListNames
> method return sender=org.freedesktop.DBus -> dest=:1.4 reply_serial=2
>    array [
>       string "org.freedesktop.DBus"
>       string ":1.4"
>       string ":1.0"
>       string "org.bluez"
>    ]
> 
> But when I query default adapter, I don't get a response
> 
> root@am335x-evm:~# dbus-send --system --print-reply --dest=org.bluez /
> org.bluez.Manager.ListAdapters
> method return sender=:1.0 -> dest=:1.5 reply_serial=2
>    array [
>    ]
> 
> What's missing to get it working ? Any help is appreciated
> 
> Thanks
> Ankur
> 
> "Knowledge is knowing tomato is a fruit, wisdom is not putting it in a
> fruit salad"
> 
> On Thu, Dec 17, 2015 at 7:24 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> wrote:
> 
> > ​​
> > Hi,
> >
> > I am trying to use WL1835  bluetooth with AM335x EVM. Software is
> > meta-arago daisy.
> >
> > When I run bluetooth agent, I get error  "Can't get default adapter"
> >
> > Following is the sequence of commands:
> >
> > root@am335x-evm:~# bluetoothd
> >
> > root@am335x-evm:~# hciconfig hci0 up
> >
> > [  944.008593] (stc):  chnl_id list empty :4
> > [  944.012749] (stk) : st_kim_start(stk) :ldisc_install = 1uim:poll broke
> > due to event 10(PRI:2/ERR:8)
> >
> > uim:read 1 from install
> >
> > uim:@ st_uart_config
> > uim: signal received, opening /dev/ttyS1
> > uim:@ set_baud_rate
> > uim:set_baud_rate() done
> > uim:Setting speed to 3000000
> > uim:@ read_command_complete
> > uim: Command complete started
> > uim:@ read_hci_event
> > uim: read_hci_event
> > uim:Command complete done
> > [  944.180311] (stc): st_tty_open
> > uim:Speed changing to 3000000, 1
> > uim:@ set_custom_baud_rate
> > (stk) :line discipline installeduim:Installed N_TI_WL Line displine
> > [  944.194437] (stk) :TIInit_11.8.32.bts
> > uim:begin polling...
> > (stk) :change remote baud rate command in firmware
> > [  944.214516] (stk) :skipping the wait event of change remote baud[
> >  944.928331] (stc): add_channel_to_table: id 4
> > [  944.932771] (stc): add_channel_to_table: id 2
> > [  944.937149] (stc): add_channel_to_table: id 3
> >
> > root@am335x-evm:~# hcitool scan
> > Scanning ...
> >         00:02:72:E3:0F:7F       RS232 Dongle Slave
> >
> > root@am335x-evm:~# agent hci0 00:02:72:E3:0F:7F
> > Can't get default adapter
> > No such adapter
> >
> > root@am335x-evm:~# dmesg | grep Bluetooth
> > [    3.475348] Bluetooth: Core ver 2.18
> > [    3.483613] Bluetooth: HCI device and connection manager initialized
> > [    3.663793] Bluetooth: HCI socket layer initialized
> > [    3.668731] Bluetooth: L2CAP socket layer initialized
> > [    3.814838] Bluetooth: SCO socket layer initialized
> > [   16.667945] Bluetooth: st_register failed -22
> >
> > What am I missing here ?
> >
> > thanks
> > Ankur
> >

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


