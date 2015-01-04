/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   strpush.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: luperez <luperez@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2014/11/16 06:36:51 by luperez           #+#    #+#             */
/*   Updated: 2014/12/02 07:39:06 by luperez          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

t_str	*strpush(t_str **alst, t_str *new)
{
	t_str	*tmp;

	if (!alst || !new)
		return (*alst);
	tmp = *alst;
	while (tmp->next != NULL)
		tmp = tmp->next;
	tmp->next = new;
	return (new);
}
